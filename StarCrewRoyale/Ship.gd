extends KinematicBody2D


export var ACCELERATION = 100
export var MAX_SPEED = 600
export var ROLL_SPEED = 100
export var FRICTION = 1


enum {
	MOVE,
	ROLL,
	ATTACK,
	HIT
}

var hearts = 4

var i = 0

var state = MOVE
var velocity2 = Vector2.ZERO
var roll_vector = Vector2.DOWN

onready var engine = $Engine
onready var animationPlayer = $Engine/Visible/AnimationPlayer
onready var animationTree = $Engine/Visible/AnimationTree
onready var animationState = animationTree.get("parameters/playback")





func _ready():
	randomize()



func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
		
	
func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ship_right") - Input.get_action_strength("ship_left")
	input_vector.y = Input.get_action_strength("ship_down") - Input.get_action_strength("ship_up")

	input_vector = input_vector.normalized()

	
	if input_vector != Vector2.ZERO:
		print(velocity2)
		#print(rad2deg(input_vector.angle()))
		animationPlayer.play("Pulse")
		if rad2deg(engine.transform.get_rotation()) >= rad2deg(input_vector.angle()) - 4 && rad2deg(engine.transform.get_rotation()) <= rad2deg(input_vector.angle())+ 4:
			print()
			#print(rad2deg(input_vector.angle()))
		else:
			#print(rad2deg(engine.transform.get_rotation()))
			if rad2deg(input_vector.angle()) > rad2deg(engine.transform.get_rotation()):
				engine.rotate(.07)
			elif rad2deg(engine.transform.get_rotation()) > 170 && rad2deg(input_vector.angle()) < -80:
				engine.rotate(.07)
			else:
				engine.rotate(-.07)
		
		roll_vector = input_vector
		#print("Vector2" , input_vector, ",")
		velocity2 = velocity2.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		#state = ROLL
	else:
		#print(velocity2)
		animationPlayer.play("StopStart")
		#print("Vector2" , input_vector, ",")
		

		velocity2 = velocity2.move_toward(Vector2.ZERO, FRICTION * delta)
		#state = ATTACK
	
	move()
	



func move():
	velocity2 = move_and_slide(velocity2)

