extends KinematicBody2D



enum {
	MOVE,
	ROLL,
	ATTACK,
	HIT
}


var i = 0

var state = ATTACK


onready var sheild = $Shield

onready var animationPlayer = $Shield/Sprite/ShieldPlayer

var workable = false
var working = false


func _ready():
	randomize()



func _physics_process(delta):

	if workable:
		if !working && Input.is_action_just_pressed("ui_swing"):
			working = true
			state = MOVE
			
		elif working && Input.is_action_just_pressed("ui_swing"):
			state = ATTACK
			working = false
	match state:
		MOVE:
			move_state()
		ATTACK:
			attack_state()
		
	
func move_state():
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	input_vector = input_vector.normalized()


	##print(rad2deg(input_vector.angle()))
	if input_vector == Vector2.ZERO:
		pass
	elif input_vector.x != 0 && input_vector.x != -1 && input_vector.x != 1:
		animationPlayer.play("Stop")
	
	elif rad2deg(sheild.transform.get_rotation()) >= rad2deg(input_vector.angle()) - 2 && rad2deg(sheild.transform.get_rotation()) <= rad2deg(input_vector.angle())+ 2:

		animationPlayer.play("Pulse")
		##print(rad2deg(input_vector.angle()))
	else:
		animationPlayer.play("Stop")
		##print(rad2deg(engine.transform.get_rotation()))
		if rad2deg(input_vector.angle()) > rad2deg(sheild.transform.get_rotation()):
			sheild.rotate(.07)
		elif rad2deg(sheild.transform.get_rotation()) > 170 && rad2deg(input_vector.angle()) < -80:
			sheild.rotate(.07)
		else:
			sheild.rotate(-.07)
	

func attack_state():
	animationPlayer.play("Stop")



func _on_Area2D_area_entered(area):
	workable = true


func _on_SheildTerminal_area_exited(area):
	workable = false
