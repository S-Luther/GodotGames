extends Control

onready var Key_Display = $Key_Code2
onready var Player2 = $Player_2
onready var Player2B = $Player2Add
onready var Player3 = $Player_3
onready var Player3B = $Player3Add
onready var Player4 = $Player_4
onready var Player4B = $Player4Add
onready var Test_Setup = self

var mode = ""
var current_ev = 0


func _unhandled_key_input(event):
	if event.is_pressed():
		current_ev = event.scancode
		print(event.scancode)
		Key_Display.text = String(current_ev)

func _on_Right_pressed():
	var ev = InputEventKey.new()
	ev.scancode = current_ev
	print(ev.scancode)
	if InputMap.has_action("p1_right"):
		InputMap.erase_action("p1_right")
	InputMap.add_action("p1_right")
	InputMap.action_add_event("p1_right", ev)


func _on_Down_pressed():
	var ev = InputEventKey.new()
	ev.scancode = current_ev
	print(ev.scancode)
	if InputMap.has_action("p1_down"):
		InputMap.erase_action("p1_down")
	InputMap.add_action("p1_down")
	InputMap.action_add_event("p1_down", ev)



func _on_Up_pressed():
	var ev = InputEventKey.new()
	ev.scancode = current_ev
	if InputMap.has_action("p1_up"):
		InputMap.erase_action("p1_up")
	print(ev.scancode)
	InputMap.add_action("p1_up")
	InputMap.action_add_event("p1_up", ev)


func _on_Left_pressed():
	var ev = InputEventKey.new()
	ev.scancode = current_ev
	print(ev.scancode)
	if InputMap.has_action("p1_left"):
		InputMap.erase_action("p1_left")
	InputMap.add_action("p1_left")
	InputMap.action_add_event("p1_left", ev)


func _on_Primary_pressed():
	var ev = InputEventKey.new()
	ev.scancode = current_ev
	print(ev.scancode)
	if InputMap.has_action("p1_swing"):
		InputMap.erase_action("p1_swing")
	InputMap.add_action("p1_swing")
	InputMap.action_add_event("p1_swing", ev)


func _on_Seconday_pressed():
	pass # Replace with function body.


func _on_Player2Add_pressed():
	Player2.visible = true
	Player2B.visible = false


func _on_Player3Add_pressed():
	Player3.visible = true
	Player3B.visible = false


func _on_Player4Add_pressed():
	Player4.visible = true
	Player4B.visible = false


func _on_p2Right_pressed():
	var ev = InputEventKey.new()
	ev.scancode = current_ev
	
	InputMap.erase_action("p2_right")
	InputMap.add_action("p2_right")
	InputMap.action_add_event("p2_right", ev)


func _on_p2Down_pressed():
	var ev = InputEventKey.new()
	ev.scancode = current_ev
	InputMap.erase_action("p2_down")
	InputMap.add_action("p2_down")
	InputMap.action_add_event("p2_down", ev)


func _on_p2Up_pressed():
	var ev = InputEventKey.new()
	ev.scancode = current_ev
	
	InputMap.erase_action("p2_up")
	InputMap.add_action("p2_up")
	InputMap.action_add_event("p2_up", ev)


func _on_p2Left_pressed():
	var ev = InputEventKey.new()
	ev.scancode = current_ev
	
	InputMap.erase_action("p2_left")
	InputMap.add_action("p2_left")
	InputMap.action_add_event("p2_left", ev)


func _on_p2Primary_pressed():
	var ev = InputEventKey.new()
	ev.scancode = current_ev
	print(ev.scancode)
	if InputMap.has_action("p2_swing"):
		InputMap.erase_action("p2_swing")
	InputMap.add_action("p2_swing")
	InputMap.action_add_event("p2_swing", ev)


func _on_p2Secondary_pressed():
	pass # Replace with function body.


func _on_p3Right_pressed():
	var ev = InputEventKey.new()
	ev.scancode = current_ev
	
	InputMap.erase_action("p3_right")
	InputMap.add_action("p3_right")
	InputMap.action_add_event("p3_right", ev)


func _on_p3Down_pressed():
	var ev = InputEventKey.new()
	ev.scancode = current_ev
	InputMap.erase_action("p3_down")
	InputMap.add_action("p3_down")
	InputMap.action_add_event("p3_down", ev)


func _on_p3Up_pressed():
	var ev = InputEventKey.new()
	ev.scancode = current_ev
	
	InputMap.erase_action("p3_up")
	InputMap.add_action("p3_up")
	InputMap.action_add_event("p3_up", ev)


func _on_p3Left_pressed():
	var ev = InputEventKey.new()
	ev.scancode = current_ev
	
	InputMap.erase_action("p3_left")
	InputMap.add_action("p3_left")
	InputMap.action_add_event("p3_left", ev)


func _on_p3Primary_pressed():
	pass # Replace with function body.


func _on_p3Secondary_pressed():
	pass # Replace with function body.


func _on_p4Right_pressed():
	var ev = InputEventKey.new()
	ev.scancode = current_ev
	
	InputMap.erase_action("p4_right")
	InputMap.add_action("p4_right")
	InputMap.action_add_event("p4_right", ev)


func _on_p4Down_pressed():
	var ev = InputEventKey.new()
	ev.scancode = current_ev
	InputMap.erase_action("p4_down")
	InputMap.add_action("p4_down")
	InputMap.action_add_event("p4_down", ev)


func _on_p4Up_pressed():
	var ev = InputEventKey.new()
	ev.scancode = current_ev
	
	InputMap.erase_action("p4_up")
	InputMap.add_action("p4_up")
	InputMap.action_add_event("p4_up", ev)


func _on_p4Left_pressed():
	var ev = InputEventKey.new()
	ev.scancode = current_ev
	
	InputMap.erase_action("p4_left")
	InputMap.add_action("p4_left")
	InputMap.action_add_event("p4_left", ev)


func _on_p4Primary_pressed():
	pass # Replace with function body.


func _on_p4Secondary_pressed():
	pass # Replace with function body.


func _on_2Player_pressed():
	Test_Setup.visible =false


func _on_1Player2_pressed():
	Test_Setup.visible =false


func _on_3Player_pressed():
	Test_Setup.visible =false
