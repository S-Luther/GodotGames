extends Control

onready var Key_Display = $Key_Code2
onready var Player2 = $Player_2
onready var Player2B = $Player2Add
onready var Player3 = $Player_3
onready var Player3B = $Player3Add
onready var Player4 = $Player_4
onready var Player4B = $Player4Add
onready var Test_Setup = self
var config = ConfigFile.new()
var mode = ""
var current_ev = 0

var setup = true

func _ready():
	var configl = ConfigFile.new()
	
	var err = configl.load("user://inputs.cfg")
	
	if err != OK:
		return
	
	for input in configl.get_sections():
		InputMap.add_action(configl.get_value(input, "action")) 
		var ev = InputEventKey.new()
		ev = configl.get_value(input, "ev")
		InputMap.action_add_event(configl.get_value(input, "action"), ev)

func saveInputs(theaction, theev):
	config.set_value(theaction, "action", theaction)
	config.set_value(theaction, "ev", theev)
	config.save("user://inputs.cfg")
	

func _unhandled_key_input(event):
	if event.is_pressed() && setup:
		current_ev = event

		Key_Display.text = String(event.scancode)
func _unhandled_input(event):
	if event.is_pressed() && setup:
		#print(event.get_instance_id())
		current_ev = event
		Key_Display.text = String(event.get_instance_id())


func _on_Right_pressed():
	var ev = InputEventKey.new()
	ev = current_ev

	if InputMap.has_action("p1_right"):
		InputMap.erase_action("p1_right")
	InputMap.add_action("p1_right")
	InputMap.action_add_event("p1_right", ev)
	saveInputs("p1_right", ev)


func _on_Down_pressed():
	var ev = InputEventKey.new()
	ev = current_ev

	if InputMap.has_action("p1_down"):
		InputMap.erase_action("p1_down")
	InputMap.add_action("p1_down")
	InputMap.action_add_event("p1_down", ev)
	saveInputs("p1_down", ev)


func _on_Up_pressed():
	var ev = InputEventKey.new()
	ev = current_ev
	if InputMap.has_action("p1_up"):
		InputMap.erase_action("p1_up")

	InputMap.add_action("p1_up")
	InputMap.action_add_event("p1_up", ev)
	saveInputs("p1_up", ev)

func _on_Left_pressed():
	var ev = InputEventKey.new()
	ev = current_ev

	if InputMap.has_action("p1_left"):
		InputMap.erase_action("p1_left")
	InputMap.add_action("p1_left")
	InputMap.action_add_event("p1_left", ev)
	saveInputs("p1_left", ev)

func _on_Primary_pressed():
	var ev = InputEventKey.new()
	ev = current_ev

	if InputMap.has_action("p1_swing"):
		InputMap.erase_action("p1_swing")
	InputMap.add_action("p1_swing")
	InputMap.action_add_event("p1_swing", ev)
	saveInputs("p1_swing", ev)

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
	ev = current_ev
	if InputMap.has_action("p2_right"):
		InputMap.erase_action("p2_right")
	InputMap.add_action("p2_right")
	InputMap.action_add_event("p2_right", ev)
	saveInputs("p2_right", ev)

func _on_p2Down_pressed():
	var ev = InputEventKey.new()
	ev = current_ev
	if InputMap.has_action("p2_down"):
		InputMap.erase_action("p2_down")
	InputMap.add_action("p2_down")
	InputMap.action_add_event("p2_down", ev)
	saveInputs("p2_down", ev)

func _on_p2Up_pressed():
	var ev = InputEventKey.new()
	ev = current_ev
	
	if InputMap.has_action("p2_up"):
		InputMap.erase_action("p2_up")
	InputMap.add_action("p2_up")
	InputMap.action_add_event("p2_up", ev)
	saveInputs("p2_up", ev)

func _on_p2Left_pressed():
	var ev = InputEventKey.new()
	ev = current_ev
	
	if InputMap.has_action("p2_left"):
		InputMap.erase_action("p2_left")
	InputMap.add_action("p2_left")
	InputMap.action_add_event("p2_left", ev)
	saveInputs("p2_left", ev)

func _on_p2Primary_pressed():
	var ev = InputEventKey.new()
	ev = current_ev

	if InputMap.has_action("p2_swing"):
		InputMap.erase_action("p2_swing")
	InputMap.add_action("p2_swing")
	InputMap.action_add_event("p2_swing", ev)
	saveInputs("p2_swing", ev)

func _on_p2Secondary_pressed():
	pass # Replace with function body.


func _on_p3Right_pressed():
	var ev = InputEventKey.new()
	ev = current_ev
	
	if InputMap.has_action("p3_right"):
		InputMap.erase_action("p3_right")
	InputMap.add_action("p3_right")
	InputMap.action_add_event("p3_right", ev)
	saveInputs("p3_right", ev)

func _on_p3Down_pressed():
	var ev = InputEventKey.new()
	ev = current_ev
	if InputMap.has_action("p3_down"):
		InputMap.erase_action("p3_down")
	InputMap.add_action("p3_down")
	InputMap.action_add_event("p3_down", ev)
	saveInputs("p3_down", ev)

func _on_p3Up_pressed():
	var ev = InputEventKey.new()
	ev = current_ev
	
	if InputMap.has_action("p3_up"):
		InputMap.erase_action("p3_up")
	InputMap.add_action("p3_up")
	InputMap.action_add_event("p3_up", ev)
	saveInputs("p3_up", ev)

func _on_p3Left_pressed():
	var ev = InputEventKey.new()
	ev = current_ev
	
	if InputMap.has_action("p3_left"):
		InputMap.erase_action("p3_left")
	InputMap.add_action("p3_left")
	InputMap.action_add_event("p3_left", ev)
	saveInputs("p3_left", ev)

func _on_p3Primary_pressed():
	var ev = InputEventKey.new()
	ev = current_ev

	if InputMap.has_action("p3_swing"):
		InputMap.erase_action("p3_swing")
	InputMap.add_action("p3_swing")
	InputMap.action_add_event("p3_swing", ev)
	saveInputs("p3_swing", ev)

func _on_p3Secondary_pressed():
	pass # Replace with function body.


func _on_p4Right_pressed():
	var ev = InputEventKey.new()
	ev = current_ev
	
	if InputMap.has_action("p4_right"):
		InputMap.erase_action("p4_right")
	InputMap.add_action("p4_right")
	InputMap.action_add_event("p4_right", ev)
	saveInputs("p4_right", ev)

func _on_p4Down_pressed():
	var ev = InputEventKey.new()
	ev = current_ev
	if InputMap.has_action("p4_down"):
		InputMap.erase_action("p4_down")
	InputMap.add_action("p4_down")
	InputMap.action_add_event("p4_down", ev)
	saveInputs("p4_down", ev)

func _on_p4Up_pressed():
	var ev = InputEventKey.new()
	ev = current_ev
	
	if InputMap.has_action("p4_up"):
		InputMap.erase_action("p4_up")
	InputMap.add_action("p4_up")
	InputMap.action_add_event("p4_up", ev)
	saveInputs("p4_up", ev)

func _on_p4Left_pressed():
	var ev = InputEventKey.new()
	ev = current_ev
	
	if InputMap.has_action("p4_left"):
		InputMap.erase_action("p4_left")
	InputMap.add_action("p4_left")
	InputMap.action_add_event("p4_left", ev)
	saveInputs("p4_left", ev)

func _on_p4Primary_pressed():
	var ev = InputEventKey.new()
	ev = current_ev
	if InputMap.has_action("p4_swing"):
		InputMap.erase_action("p4_swing")
	InputMap.add_action("p4_swing")
	InputMap.action_add_event("p4_swing", ev)
	saveInputs("p4_swing", ev)


func _on_p4Secondary_pressed():
	pass # Replace with function body.


func _on_1Player2_pressed():
	Test_Setup.visible =false
	setup = false

func _on_3Player_pressed():
	Test_Setup.visible =false
	setup = false




