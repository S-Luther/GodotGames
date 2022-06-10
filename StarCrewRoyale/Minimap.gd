extends Sprite

var workable = false
var working = false
onready var animationPlayer = $AnimationPlayer

func _physics_process(delta):
	if workable:
		if working:
			if Input.is_action_just_pressed("ui_swing"):
				working = false
				animationPlayer.play("off")
		elif Input.is_action_just_pressed("ui_swing"):
			working = true
			animationPlayer.play("on")
	else:
		animationPlayer.play("off")
		
			

func _on_NavTerm_area_entered(area):
	workable = true


func _on_NavTerm_area_exited(area):
	workable = false
