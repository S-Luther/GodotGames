extends KinematicBody2D


export var ACCELERATION = 400
export var MAX_SPEED = 850

export var ROLL_SPEED = 100
export var FRICTION = 1


enum {
	MOVE,
	FALL,
	ATTACK,
	HIT
}

var hearts = 4

var i = 0

var state = ATTACK
var velocity2 = Vector2.ZERO
var roll_vector = Vector2.DOWN
var init = false

onready var nav = $Engine/NavTerminal/
onready var minimap = $Engine/NavTerminal/UI/
onready var player1 = $Engine/Player1
onready var engine = $Engine
onready var timer = $Timer
onready var animationPlayer = $Engine/Visible/AnimationPlayer

var workable = false
var working = false


func _ready():
	randomize()
	self.add_to_group("Player")



func _process(delta):

	if player1.position.x >100 || player1.position.x<-100 || player1.position.y >100 || player1.position.y<-100 :
		player1.position = Vector2.ZERO
	if timer.is_stopped():
		init = true
	
	if workable:
		if !working && Input.is_action_just_pressed("p1_swing"):
			working = true
			state = MOVE
			
		elif working && Input.is_action_just_pressed("p1_swing"):
			state = ATTACK
			working = false
			nav.crash()
	match state:
		MOVE:
			move_state(delta)
		ATTACK:
			attack_state(delta)
		

static func lerp_angle(a, b, t):
	if abs(a-b) >= PI:
		if a > b:
			a = normalize_angle(a) - 2.0 * PI
		else:
			b = normalize_angle(b) - 2.0 * PI
	return lerp(a, b, t)


static func normalize_angle(x):
	return fposmod(x + PI, 2.0*PI) - PI


func move_state(delta):
	if working && workable:
		if player1.position.x < 40:
			working = false
			workable = false
		var input_vector = Vector2.ZERO
		input_vector.x = Input.get_action_strength("p1_left") - Input.get_action_strength("p1_right")
		input_vector.y = Input.get_action_strength("p1_up") - Input.get_action_strength("p1_down")

		input_vector = input_vector.normalized()

		
		if input_vector != Vector2.ZERO:
			##print(velocity2)
			###print(rad2deg(input_vector.angle()))
			animationPlayer.play("Pulse")
			var target_angle = input_vector.angle()
			
			var smooth_angle
			var lerp_speed = 5.0
			smooth_angle = lerp_angle(engine.transform.get_rotation(), target_angle, delta*lerp_speed)

			engine.rotation = smooth_angle
			
			player1.rotation = -smooth_angle
			minimap.rotation = -smooth_angle + -PI/2
			
			if player1.position.x > 55:
				player1.position = player1.position + Vector2(-1,-0)
			if player1.position.x < 65:
				player1.position = player1.position + Vector2(1,-0)
			
			roll_vector = input_vector
			###print("Vector2" , input_vector, ",")
			velocity2 = velocity2.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
			#state = ROLL
		else:

			animationPlayer.play("StopStart")

			###print("Vector2" , input_vector, ",")
			

			velocity2 = velocity2.move_toward(Vector2.ZERO, FRICTION * delta)
			#state = ATTACK
		
		move()
	else: 
		state = ATTACK
		working = false
	

func attack_state(delta):
	velocity2 = velocity2
	velocity2 = velocity2.move_toward(Vector2.ZERO, FRICTION * delta)
	animationPlayer.play("StopStart")

	move()

func move():
	##print(velocity2)
	velocity2 = move_and_slide(velocity2)

func crash():
	player1.crash()
	nav.crash()
	workable = false
	working = false
	state = ATTACK
	#print("crash")

func _on_Helm_area_entered(area):
	workable = true
	#print("helm on")


func _on_Helm_area_exited(area):
	#print("turn off heml")
	workable = false



func _on_Engine_area_entered(area):
	if area.name == "LeftBounds":
		if init:
			##print(area)
			velocity2 = Vector2(689, 0)
			move()
			crash()
	elif area.name == "RightBounds":
		if init:
			##print(area)
			velocity2 = Vector2(-689, 0)
			move()
			crash()
	elif area.name == "TopBounds":
		if init:
			##print(area)
			velocity2 = Vector2(0,689)
			move()
			crash()
	elif area.name == "BottomBounds":
		if init:
			##print(area)
			velocity2 = Vector2(0,-689)
			move()
			crash()
