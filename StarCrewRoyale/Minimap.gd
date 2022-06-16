extends KinematicBody2D

var navWorkable = false
var navWorking = false
onready var animationPlayer = $Minimap/Minimap/AnimationPlayer
onready var camera = $Camera2D
var prefix = ""

func _physics_process(delta):
	if navWorkable:
		if navWorking:
			if Input.is_action_just_pressed(prefix+"_swing"):
				navWorking = false
				animationPlayer.play("off")
			if Input.is_action_just_pressed(prefix+"_down") && camera.zoom.x > .4 && camera.zoom.y > .4:
				print(camera.zoom.x)
				print(camera.zoom.y)
				camera.zoom = Vector2(camera.zoom.x - .1, camera.zoom.y - .1)
			if Input.is_action_just_pressed(prefix+"_up")  && camera.zoom.x < 1.5 && camera.zoom.y < 1.5:
				print(camera.zoom.x)
				print(camera.zoom.y)
				camera.zoom = Vector2(camera.zoom.x + .1, camera.zoom.y + .1)
		elif Input.is_action_just_pressed(prefix+"_swing"):
			navWorking = true
			animationPlayer.play("on")
	else:
		animationPlayer.play("off")
		
			
func crash():
	navWorkable = false
	navWorking = false

func _on_NavTerm_area_entered(area):
	navWorkable = true
	print("nav on")
	if !navWorking:
		prefix = area.name


func _on_NavTerm_area_exited(area):
	print("turn off nav")
	navWorkable = false
