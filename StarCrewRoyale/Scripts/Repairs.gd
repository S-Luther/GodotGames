extends KinematicBody2D
var workable = false
var working = false
var colors = ["Dark","Red", "Green", "Gold"]
var i = 0
onready var animationPlayer = $Hull/AnimationPlayer
onready var animationPlayer2 = $Hull2/AnimationPlayer
var prefix = ""

func _process(delta):
	animationPlayer.play(colors[i])
	animationPlayer2.play(colors[i])
	if workable:
		if working:
			if Input.is_action_just_pressed(prefix+"_swing"):
				working = false
				animationPlayer.play("off")
			if Input.is_action_just_pressed(prefix+"_right"):
				i = i + 1
				if i == 4:
					i=0
				animationPlayer.play(colors[i])
			if Input.is_action_just_pressed(prefix+"_left"):
				i = i - 1
				if i == -1:
					i=3
				animationPlayer.play(colors[i])
				animationPlayer2.play(colors[i])
				
		elif Input.is_action_just_pressed(prefix+"_swing"):
			working = true
			
func crash():
	workable = false
	working = false

func _on_Repairs_area_entered(area):
	workable = true
	if !working:
		prefix = area.name
	


func _on_Repairs_area_exited(area):
	workable = false
