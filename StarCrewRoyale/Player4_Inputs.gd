extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var mode = ""
var current_ev


func _process(delta):

	
	match mode:
		"right":
			pass
		"left":
			pass
		"up":
			pass
		"down":
			pass
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _unhandled_key_input(event):
	if event.is_pressed():
		current_ev = event.scancode
		print(event.scancode)

func _on_Right_pressed():
	var ev = InputEventKey.new()
	ev.scancode = current_ev
	
	InputMap.erase_action("ui_right")
	InputMap.add_action("ui_right")
	InputMap.action_add_event("ui_right", ev)


func _on_Down_pressed():
	var ev = InputEventKey.new()
	ev.scancode = current_ev
	InputMap.erase_action("ui_down")
	InputMap.add_action("ui_down")
	InputMap.action_add_event("ui_down", ev)



func _on_Up_pressed():
	var ev = InputEventKey.new()
	ev.scancode = current_ev
	
	InputMap.erase_action("ui_up")
	InputMap.add_action("ui_up")
	InputMap.action_add_event("ui_up", ev)


func _on_Left_pressed():
	var ev = InputEventKey.new()
	ev.scancode = current_ev
	
	InputMap.erase_action("ui_left")
	InputMap.add_action("ui_left")
	InputMap.action_add_event("ui_left", ev)
