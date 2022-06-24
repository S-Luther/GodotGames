extends Node

enum ReadPersmissions { NO_READ, OWNER_READ, PUBLIC_READ}

enum WritePersmissions {NO_WRITE, OWNER_WRITE }

const KEY := "nakama_StarCrew"

var _session: NakamaSession

var _client := Nakama.create_client(KEY, "127.0.0.1", 7350, "http")

var _socket: NakamaSocket

var _world_id := ""
var _presences := {}



func authenticate_async(email: String, password: String):
	var result := OK
	
	var new_session: NakamaSession = yield(_client.authenticate_email_async(email, password, null, true), "completed")
	
	if not new_session.is_exception():
		_session = new_session
	else:
		result = new_session.get_exception().status_code
	
	return result


func connect_to_server_async() -> int:
	_socket = Nakama.create_socket_from(_client)
	var result: NakamaAsyncResult = yield(_socket.connect_async(_session), "completed")
	if not result.is_exception():
		_socket.connect("closed", self, "_on_NakamaSocket_closed")
		return OK
	return ERR_CANT_CONNECT
	
func join_world_async() -> Dictionary:
	var world: NakamaAPI.ApiRpc = yield(_client.rpc_async(_session, "get_world_id", ""), "completed")
	if not world.is_exception():
		_world_id = world.payload
	
	var match_join_result: NakamaRTAPI.Match =  yield(_socket.join_match_async(_world_id), "completed")
	
	if match_join_result.is_exception():
		var exception: NakamaException = match_join_result.get_exception()
		printerr("Error joining the match: %s - %s" % [exception.status_code, exception.message])
		return {}
		
	for presence in match_join_result.presences:
		_presences[presence.user_id] = presence
		
	return _presences

func write_characters_async(characters := []) -> void:
	yield(_client.write_storage_objects_async(
		_session, 
		[
			NakamaWriteStorageObject.new(
				"player_data",
				"characters",
				ReadPersmissions.OWNER_READ,
				WritePersmissions.OWNER_WRITE,
				JSON.print({characters = characters}),
				""
			)
		]
	), "completed")
	
func get_characters_async() -> Array:
	var characters := []
	var storage_objects: NakamaAPI.ApiStorageObjects = yield(_client.read_storage_objects_async(
		_session, [NakamaStorageObjectId.new("player_data", "characters", _session.user_id)]
	), "completed")
	
	if storage_objects.objects:
		var decoded: Array = JSON.parse(storage_objects.objects[0].value).result.characters
		return decoded
	
	return [characters]

func _on_NakamaSocket_closed() -> void:
	_socket = null
