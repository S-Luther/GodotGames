extends Sprite

var workable = false
var working = false
onready var animationPlayer = $AnimationPlayer
onready var camera = $Camera2D

func _physics_process(delta):
	if workable:
		if working:
			if Input.is_action_just_pressed("ui_swing"):
				working = false
				animationPlayer.play("off")
			if Input.is_action_just_pressed("ui_down") && camera.zoom.x > .4 && camera.zoom.y > .4:
				print(camera.zoom.x)
				print(camera.zoom.y)
				camera.zoom = Vector2(camera.zoom.x - .1, camera.zoom.y - .1)
			if Input.is_action_just_pressed("ui_up")  && camera.zoom.x < 1 && camera.zoom.y < 1:
				print(camera.zoom.x)
				print(camera.zoom.y)
				camera.zoom = Vector2(camera.zoom.x + .1, camera.zoom.y + .1)
		elif Input.is_action_just_pressed("ui_swing"):
			working = true
			animationPlayer.play("on")
	else:
		animationPlayer.play("off")
		
			

func _on_NavTerm_area_entered(area):
	workable = true


func _on_NavTerm_area_exited(area):
	workable = false
