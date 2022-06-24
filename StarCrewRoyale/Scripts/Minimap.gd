extends KinematicBody2D

var navWorkable = false
var navWorking = false

onready var camera = $Camera2D
onready var healthUI = $UI/HealthUI
onready var UI = $UI
onready var minimap = $UI/Minimap

onready var LeftBounds = $UI/Minimap/LeftBounds
onready var RightBounds = $UI/Minimap/RightBounds
onready var TopBounds = $UI/Minimap/TopBounds
onready var BottomBounds = $UI/Minimap/BottomBounds
const PlanetMarker = preload('res://Scenes/PlanetMarker.tscn')
const AsteroidMarker = preload('res://Scenes/AsteroidMarker.tscn')

var prefix = ""

var sep = 0;


func _process(delta):
	
	sep = sep + 1
	if sep%4 == 0 && navWorking && navWorkable:
		var player = get_owner()
		var asteroids = []
		var planets = []
		var LeftBD = player.get_position().x - get_tree().get_nodes_in_group("LeftB")[0].get_position().x
		var RightBD = player.get_position().x - get_tree().get_nodes_in_group("RightB")[0].get_position().x
		var TopBD = player.get_position().y - get_tree().get_nodes_in_group("TopB")[0].get_position().y
		var BottomBD = player.get_position().y - get_tree().get_nodes_in_group("BottomB")[0].get_position().y
		for object in get_tree().get_nodes_in_group("asteroids"):
			if(player.get_position().distance_to(object.get_position())<5000):
				asteroids.append(object.get_position())
		for object in get_tree().get_nodes_in_group("planets"):
			if(player.get_position().distance_to(object.get_position())<5000):
				planets.append(object.get_position())
		self.radar(player.get_position(),asteroids,planets,abs(LeftBD),abs(RightBD),abs(TopBD),abs(BottomBD))	
	if navWorkable:
		if navWorking:
			minimap.visible = true
			
			if Input.is_action_just_pressed(prefix+"_swing"):
				navWorking = false
				minimap.visible = false
			if Input.is_action_just_pressed(prefix+"_down") && camera.zoom.x > .06 && camera.zoom.y > .4:
				#print(camera.zoom.x)
				#print(camera.zoom.y)
				UI.scale = Vector2(UI.scale.x - .2,UI.scale.y - .19)
				camera.zoom = Vector2(camera.zoom.x - .1, camera.zoom.y - .1)

			if Input.is_action_just_pressed(prefix+"_up")  && camera.zoom.x < 1.3 && camera.zoom.y < 20:
				#print(camera.zoom.x)
				#print(camera.zoom.y)
				UI.scale = Vector2(UI.scale.x + .2,UI.scale.y + .19)
				camera.zoom = Vector2(camera.zoom.x + .1, camera.zoom.y + .1)

		elif Input.is_action_just_pressed(prefix+"_swing"):
			navWorking = true
			minimap.visible = false
	else:
		minimap.visible = false
		pass
		
func radar(player,asteroids,planets,LeftBD,RightBD,TopBD,BottomBD):
	#left 426 - 584
	#right 752 - 588
	#top -468 - -333
	#bottom -169 - -328
	#print(BottomBD)
	for object in get_tree().get_nodes_in_group("planetsm"):
		object.queue_free()

	for planet in planets:
		#print(planet.x - player.x , " , ", planet.y - player.y)
		var planetm = PlanetMarker.instance()

		planetm.position = Vector2(426 + (1 - (player.x - planet.x)/5000) * 158, -169 + ((1 - (planet.y - player.y)/5000) * -156))
		#planetm.position = -planetm.position
		#print(planetm.position)
		minimap.add_child(planetm)
		planetm.add_to_group("planetsm")
		
	for object in get_tree().get_nodes_in_group("asteroidsm"):
		object.queue_free()

	for asteroid in asteroids:
		#print(planet.x - player.x , " , ", planet.y - player.y)
		var asteroidm = AsteroidMarker.instance()

		asteroidm.position = Vector2(426 + (1 - (player.x - asteroid.x)/5000) * 158, -169 + ((1 - (asteroid.y - player.y)/5000) * -156))
		#planetm.position = -planetm.position
		#print(planetm.position)
		minimap.add_child(asteroidm)
		asteroidm.add_to_group("asteroidsm")
	
	if LeftBD > 5000:
		LeftBounds.position.x = 426
	else:
		LeftBounds.position.x = 426 + (1 - LeftBD/5000) * 158
	if RightBD > 5000:
		RightBounds.position.x = 752
	else:
		RightBounds.position.x = 752 - (1 - RightBD/5000) * 158
	if TopBD > 5000:
		TopBounds.position.y = -468
	else:
		TopBounds.position.y = -468 + (1 - TopBD/5000) * 135
	if BottomBD > 5000:
		BottomBounds.position.y = -169
	else:
		BottomBounds.position.y = -169 + ((1 - BottomBD/5000) * -156)
			
func crash():
	navWorkable = false
	navWorking = false
	minimap.visible = false

func _on_NavTerm_area_entered(area):
	navWorkable = true
	#print("nav on")
	if !navWorking:
		prefix = area.name


func _on_NavTerm_area_exited(area):
	#print("turn off nav")
	navWorkable = false
