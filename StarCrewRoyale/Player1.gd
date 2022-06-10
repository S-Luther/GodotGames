extends KinematicBody2D


export var ACCELERATION = 500
export var MAX_SPEED = 80
export var ROLL_SPEED = 100
export var FRICTION = 500


enum {
	MOVE,
	ROLL,
	ATTACK,
	HIT
}

var hearts = 4

var i = 0

var state = MOVE
var velocity = Vector2.ZERO
var roll_vector = Vector2.DOWN

var station = ""
var workable = false
var working = false

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")



func _ready():
	randomize()
	#stats.connect("no_health", self, "queue_free")
	animationTree.active = true


func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
		ATTACK:
			attack_state()
		
	
func move_state(delta):
	var input_vector = Vector2.ZERO
	if !working:
		input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		input_vector = input_vector.normalized()

	
	if input_vector != Vector2.ZERO:
		roll_vector = input_vector
		#print("Vector2" , input_vector, ",")

		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationTree.set("parameters/Roll/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		#state = ROLL
	else:
		#print("Vector2" , input_vector, ",")
		
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		#state = ATTACK
	
	move()
	
	if Input.is_action_just_pressed("ui_swing"):
		state = ATTACK
		if !working && workable:
			working = true
	



func move():
	velocity = move_and_slide(velocity)
	
func attack_state():
	#print("swing")
	velocity = Vector2.ZERO
	animationState.travel("Work")
	if Input.is_action_just_pressed("ui_swing") && working:
		working = false
		state = MOVE
func attack_animation_finished():
	if !working:
		state = MOVE



func _on_Area2D_area_entered(area):
	station = area.name
	print(area.name)
	workable = true


func _on_Player1_area_exited(area):
	workable = false
