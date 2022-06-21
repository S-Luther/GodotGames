extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var LeftB = $LeftBounds
onready var RightB = $RightBounds
onready var TopB = $TopBounds
onready var BottomB = $BottomBounds
onready var timer = $Timer
onready var player = $Player

const Planet = preload('res://Scenes/Planet.tscn')
const Asteroid1 = preload('res://Scenes/Asteroid1.tscn')
const Asteroid2 = preload('res://Scenes/Asteroid2.tscn')
const Asteroid3 = preload('res://Scenes/Asteroid3.tscn')
const Asteroid4 = preload('res://Scenes/Asteroid4.tscn')

var sep = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	RightB.position.x = RightB.position.x - .5
	LeftB.position.x = LeftB.position.x + .5
	TopB.position.y = TopB.position.y + .5
	BottomB.position.y = BottomB.position.y - .5
	
	for i in 100:
		var planet = Planet.instance()
		var rng = RandomNumberGenerator.new()
		rng.randomize()

		planet.position = Vector2(rng.randi_range(3000, 56000), rng.randi_range(3000, 56000))
		planet.z_index = 0
		var temp = rng.randi_range(5, 25) * .1
		planet.scale = Vector2(temp,temp)
		self.add_child(planet)
		planet.add_to_group("planets")
	for i in 50:
		var asteroid = Asteroid1.instance()
		var rng = RandomNumberGenerator.new()
		rng.randomize()

		asteroid.position = Vector2(rng.randi_range(3000, 56000), rng.randi_range(3000, 56000))
		asteroid.z_index = 0
		var temp = rng.randi_range(25, 50) * .1
		asteroid.scale = Vector2(temp,temp)
		self.add_child(asteroid)
		asteroid.add_to_group("asteroids")
	for i in 50:
		var asteroid = Asteroid2.instance()
		var rng = RandomNumberGenerator.new()
		rng.randomize()

		asteroid.position = Vector2(rng.randi_range(3000, 56000), rng.randi_range(3000, 56000))
		asteroid.z_index = 0
		var temp = rng.randi_range(25, 50) * .1
		asteroid.scale = Vector2(temp,temp)
		self.add_child(asteroid)
		asteroid.add_to_group("asteroids")
	for i in 50:
		var asteroid = Asteroid3.instance()
		var rng = RandomNumberGenerator.new()
		rng.randomize()

		asteroid.position = Vector2(rng.randi_range(3000, 56000), rng.randi_range(3000, 56000))
		asteroid.z_index = 0
		var temp = rng.randi_range(25, 50) * .1
		asteroid.scale = Vector2(temp,temp)
		self.add_child(asteroid)
		asteroid.add_to_group("asteroids")
	for i in 50:
		var asteroid = Asteroid4.instance()
		var rng = RandomNumberGenerator.new()
		rng.randomize()

		asteroid.position = Vector2(rng.randi_range(3000, 56000), rng.randi_range(3000, 56000))
		asteroid.z_index = 0
		var temp = rng.randi_range(25, 50) * .1
		asteroid.scale = Vector2(temp,temp)
		self.add_child(asteroid)
		asteroid.add_to_group("asteroids")

	
	
func _process(delta):
	sep = sep + 1
	if sep%10 == 0:
		var asteroids = []
		var planets = []
		var LeftBD = player.get_position().x - LeftB.get_position().x
		var RightBD = player.get_position().x - RightB.get_position().x
		var TopBD = player.get_position().y - TopB.get_position().y
		var BottomBD = player.get_position().y - BottomB.get_position().y
		for object in get_tree().get_nodes_in_group("asteroids"):
			if(player.get_position().distance_to(object.get_position())<5000):
				asteroids.append(object.get_position())
		for object in get_tree().get_nodes_in_group("planets"):
			if(player.get_position().distance_to(object.get_position())<5000):
				planets.append(object.get_position())
		player.radar(player.get_position(),asteroids,planets,abs(LeftBD),abs(RightBD),abs(TopBD),abs(BottomBD))
	RightB.position.x = RightB.position.x - .55
	LeftB.position.x = LeftB.position.x + .55
	TopB.position.y = TopB.position.y + .55
	BottomB.position.y = BottomB.position.y - .55
	
