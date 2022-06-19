extends KinematicBody2D


export var ACCELERATION = 500
export var MAX_SPEED = 120
export var ROLL_SPEED = 100
export var FRICTION = 500


enum {
	MOVE,
	FALL,
	ATTACK,
	HIT
}

var hearts = 4

var i = 0
var colors = ["White","Red", "Blue", "Green", "Yellow", "Pink"]

var state = MOVE
var velocity = Vector2.ZERO
var roll_vector = Vector2.DOWN

var station = ""
var workable = false
var working = false
var outfit = false

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")



func _ready():
	randomize()
	animationPlayer.play(colors[0])
	#stats.connect("no_health", self, "queue_free")
	animationTree.active = true


func _process(delta):
	match state:
		MOVE:
			move_state(delta)
		ATTACK:
			attack_state()
		FALL:
			fall_state()
	
func move_state(delta):
	var input_vector = Vector2.ZERO
	if !working:
		if !outfit:
			input_vector.x = Input.get_action_strength("p2_right") - Input.get_action_strength("p2_left")
		else:
			if Input.is_action_just_pressed("p2_right"):
				i = i + 1
				if i == 6:
					i = 0
				animationPlayer.play(colors[i])
			if Input.is_action_just_pressed("p2_left"):
				i = i - 1
				if i == -1:
					i = 5
				animationPlayer.play(colors[i])
		input_vector.y = Input.get_action_strength("p2_down") - Input.get_action_strength("p2_up")
		input_vector = input_vector.normalized()

	
	if input_vector != Vector2.ZERO:
		roll_vector = input_vector
		###print("Vector2" , input_vector, ",")

		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationTree.set("parameters/Roll/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		#state = ROLL
	else:
		###print("Vector2" , input_vector, ",")
		
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		#state = ATTACK
	
	move()
	
	if Input.is_action_just_pressed("p2_swing"):
		state = ATTACK
		if !working && workable:
			working = true
	
func crash():
	state = FALL


func move():
	velocity = move_and_slide(velocity)
	
func attack_state():
	###print("swing")
	velocity = Vector2.ZERO
	if workable:
		animationState.travel("Work")
		if Input.is_action_just_pressed("p2_swing") && working:
			working = false
			state = MOVE
	else:
		state = MOVE
func attack_animation_finished():
	if !working:
		state = MOVE
		
func fall_state():
	animationState.travel("fall")
	working = false

	
func fall_animation_finished():
	state = MOVE


func _on_p2_area_entered(area):
	if area.name == "Transporter":
		outfit = true
	station = area.name
	##print(area.name)
	workable = true


func _on_p2_area_exited(area):
	if area.name == "Transporter":
		outfit = false
		
	workable = false
