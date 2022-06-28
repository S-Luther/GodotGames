extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var LeftB = $LeftBounds
onready var RightB = $RightBounds
onready var TopB = $TopBounds
onready var BottomB = $BottomBounds
onready var timer = $Timer



const Planet = preload('res://Scenes/Planet.tscn')
const Planet2 = preload('res://Scenes/Planet2.tscn')
const Planet3 = preload('res://Scenes/Planet3.tscn')
const Asteroid1 = preload('res://Scenes/Asteroid1.tscn')
const Asteroid2 = preload('res://Scenes/Asteroid2.tscn')
const Asteroid3 = preload('res://Scenes/Asteroid3.tscn')
const Asteroid4 = preload('res://Scenes/Asteroid4.tscn')
const Asteroid5 = preload('res://Scenes/Asteroid5.tscn')
const Asteroid6 = preload('res://Scenes/Asteroid6.tscn')
const Asteroid7 = preload('res://Scenes/Asteroid7.tscn')

var sep = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	RightB.position.x = RightB.position.x - .5
	RightB.add_to_group("RightB")
	LeftB.position.x = LeftB.position.x + .5
	LeftB.add_to_group("LeftB")
	TopB.position.y = TopB.position.y + .5
	TopB.add_to_group("TopB")
	BottomB.position.y = BottomB.position.y - .5
	BottomB.add_to_group("BottomB")
	
	for i in 100:
		var planet = Planet.instance()
		var rng = RandomNumberGenerator.new()
		rng.randomize()

		planet.position = Vector2(rng.randi_range(LeftB.get_position().x + 3000, RightB.get_position().x - 3000), rng.randi_range(TopB.get_position().y + 3000, BottomB.get_position().y - 3000))
		planet.z_index = 0
		var temp = rng.randi_range(25, 55) * .4
		planet.scale = Vector2(temp,temp)
		planet.rotate(rng.randi_range(0, 360))
		self.add_child(planet)
		planet.add_to_group("planets")
	for i in 100:
		var planet = Planet2.instance()
		var rng = RandomNumberGenerator.new()
		rng.randomize()

		planet.position = Vector2(rng.randi_range(LeftB.get_position().x + 3000, RightB.get_position().x - 3000), rng.randi_range(TopB.get_position().y + 3000, BottomB.get_position().y - 3000))
		planet.z_index = 0
		var temp = rng.randi_range(50, 100) * .3
		planet.scale = Vector2(temp,temp)
		planet.rotate(rng.randi_range(0, 360))
		self.add_child(planet)
		planet.add_to_group("planets")
	for i in 70:
		var asteroid = Asteroid1.instance()
		var rng = RandomNumberGenerator.new()
		rng.randomize()

		asteroid.position = Vector2(rng.randi_range(LeftB.get_position().x + 3000, RightB.get_position().x - 3000), rng.randi_range(TopB.get_position().y + 3000, BottomB.get_position().y - 3000))
		asteroid.z_index = 0
		var temp = rng.randi_range(35, 50) * .1
		asteroid.scale = Vector2(temp,temp)
		asteroid.rotate(rng.randi_range(0, 360))
		self.add_child(asteroid)
		asteroid.add_to_group("asteroids")
	for i in 70:
		var asteroid = Asteroid2.instance()
		var rng = RandomNumberGenerator.new()
		rng.randomize()

		asteroid.position = Vector2(rng.randi_range(LeftB.get_position().x + 3000, RightB.get_position().x - 3000), rng.randi_range(TopB.get_position().y + 3000, BottomB.get_position().y - 3000))
		asteroid.z_index = 0
		var temp = rng.randi_range(35, 50) * .1
		asteroid.scale = Vector2(temp,temp)
		asteroid.rotate(rng.randi_range(0, 360))
		self.add_child(asteroid)
		asteroid.add_to_group("asteroids")
	for i in 70:
		var asteroid = Asteroid3.instance()
		var rng = RandomNumberGenerator.new()
		rng.randomize()

		asteroid.position = Vector2(rng.randi_range(LeftB.get_position().x + 3000, RightB.get_position().x - 3000), rng.randi_range(TopB.get_position().y + 3000, BottomB.get_position().y - 3000))
		asteroid.z_index = 0
		var temp = rng.randi_range(35, 50) * .1
		asteroid.scale = Vector2(temp,temp)
		asteroid.rotate(rng.randi_range(0, 360))
		self.add_child(asteroid)
		asteroid.add_to_group("asteroids")
	for i in 50:
		var asteroid = Asteroid4.instance()
		var rng = RandomNumberGenerator.new()
		rng.randomize()

		asteroid.position = Vector2(rng.randi_range(LeftB.get_position().x + 3000, RightB.get_position().x - 3000), rng.randi_range(TopB.get_position().y + 3000, BottomB.get_position().y - 3000))
		asteroid.z_index = 0
		var temp = rng.randi_range(35, 50) * .1
		asteroid.scale = Vector2(temp,temp)
		asteroid.rotate(rng.randi_range(0, 360))
		self.add_child(asteroid)
		asteroid.add_to_group("asteroids")
	for i in 50:
		var asteroid = Asteroid5.instance()
		var rng = RandomNumberGenerator.new()
		rng.randomize()

		asteroid.position = Vector2(rng.randi_range(LeftB.get_position().x + 3000, RightB.get_position().x - 3000), rng.randi_range(TopB.get_position().y + 3000, BottomB.get_position().y - 3000))
		asteroid.z_index = 0
		var temp = rng.randi_range(25, 50) * .4
		asteroid.scale = Vector2(temp,temp)
		asteroid.rotate(rng.randi_range(0, 360))
		self.add_child(asteroid)
		asteroid.add_to_group("asteroids")
	for i in 50:
		var asteroid = Asteroid6.instance()
		var rng = RandomNumberGenerator.new()
		rng.randomize()

		asteroid.position = Vector2(rng.randi_range(LeftB.get_position().x + 3000, RightB.get_position().x - 3000), rng.randi_range(TopB.get_position().y + 3000, BottomB.get_position().y - 3000))
		asteroid.z_index = 0
		var temp = rng.randi_range(25, 50) * .4
		asteroid.scale = Vector2(temp,temp)
		asteroid.rotate(rng.randi_range(0, 360))
		self.add_child(asteroid)
		asteroid.add_to_group("asteroids")
	for i in 50:
		var asteroid = Asteroid7.instance()
		var rng = RandomNumberGenerator.new()
		rng.randomize()

		asteroid.position = Vector2(rng.randi_range(LeftB.get_position().x + 3000, RightB.get_position().x - 3000), rng.randi_range(TopB.get_position().y + 3000, BottomB.get_position().y - 3000))
		asteroid.z_index = 0
		var temp = rng.randi_range(25, 50) * .4
		asteroid.scale = Vector2(temp,temp)
		asteroid.rotate(rng.randi_range(0, 360))
		self.add_child(asteroid)
		asteroid.add_to_group("asteroids")	
	
func _process(delta):
		#player.radar(player.get_position(),asteroids,planets,abs(LeftBD),abs(RightBD),abs(TopBD),abs(BottomBD))
	RightB.position.x = RightB.position.x - .55
	LeftB.position.x = LeftB.position.x + .55
	TopB.position.y = TopB.position.y + .55
	BottomB.position.y = BottomB.position.y - .55
	
