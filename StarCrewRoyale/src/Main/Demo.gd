extends Node

onready var server_connection := $ServerConnection
onready var debug_panel := $CanvasLayer/Panel

func _ready() -> void:
	yield(request_authentication(), "completed")
	yield(connect_to_server(), "completed")
	yield(join_world(), "completed")
	
	var characters := [
		{name = "Jack", color = Color.blue.to_html(false)},
		{name = "Lisa", color = Color.red.to_html(false)},
	]
	
	yield(server_connection.write_characters_async(characters), "completed")
	var characters_data = yield(server_connection.get_characters_async(), "completed")
	
		
	debug_panel.write_message("From server storage: \n" + String(characters_data))

func request_authentication() -> void:
	var email := "tesst@test.com"
	var password : = "11111111"
	debug_panel.write_message("Authenticating user %s." % email)
	var result: int = yield(server_connection.authenticate_async(email, password), "completed")
	
	if result == OK:
		debug_panel.write_message("Authenticated user %s successfully." % email)
	else:
		debug_panel.write_message("We could not authenticate user %s." % email)


func connect_to_server() -> void:
	var result: int = yield(server_connection.connect_to_server_async(), "completed")
	if result == OK:
		debug_panel.write_message("Connected to server.")
	elif ERR_CANT_CONNECT:
		debug_panel.write_message("Could not connect to server.")


func join_world() -> void:
	var presences: Dictionary = yield(server_connection.join_world_async(), "completed")
	debug_panel.write_message("Joined world")
	debug_panel.write_message("Other connected players: %s" % presences.size())
