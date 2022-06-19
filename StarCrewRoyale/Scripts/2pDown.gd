extends Area2D
enum {
	MOVE,
	ROLL,
	ATTACK,
	HIT
}


var i = 0

var state = ATTACK

var workable = false
var working = false

var prefix = ""

var rota = 0

onready var gun = $GunDown

func getRotation(rot):
	if rot != 0:
		rota = rot

func _ready():
	randomize()

func _physics_process(delta):
	#print(rota)
	if workable:
		if !working && Input.is_action_just_pressed(prefix+"_swing"):
			working = true
			state = MOVE
			
		elif working && Input.is_action_just_pressed(prefix+"_swing"):
			state = ATTACK
			working = false
	match state:
		MOVE:
			move_state(rota)
		ATTACK:
			attack_state()
		
	
func move_state(rot):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength(prefix+"_right") - Input.get_action_strength(prefix+"_left")
	input_vector.y = Input.get_action_strength(prefix+"_down") - Input.get_action_strength(prefix+"_up")

	input_vector = input_vector.normalized()

	
	var angle = rad2deg(input_vector.angle())
	if rot != 0:
		angle = angle + rot - 180
		#print(angle)
		if angle > 360:
			angle = angle - 360
	if input_vector == Vector2.ZERO:
		pass
	elif rad2deg(gun.transform.get_rotation()) >= angle - 4 && rad2deg(gun.transform.get_rotation()) <= angle + 4:
		pass
	else:
		###print(rad2deg(engine.transform.get_rotation()))
		if angle > rad2deg(gun.transform.get_rotation()):
			gun.rotate(.02)
		else:
			gun.rotate(-.02)
	

func attack_state():
	pass

func crash():
	workable = false
	working = false
	state=ATTACK
	


func _on_Gunner_area_entered(area):
	workable = true
	if !working:
		prefix = area.name


func _on_Gunner_area_exited(area):
	workable = false
