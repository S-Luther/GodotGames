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
const Asteroid1 = preload('res://Scenes/Asteroid1.tscn')

# Called when the node enters the scene tree for the first time.
func _ready():
	RightB.position.x = RightB.position.x - .5
	LeftB.position.x = LeftB.position.x + .5
	TopB.position.y = TopB.position.y + .5
	BottomB.position.y = BottomB.position.y - .5
	
	for i in 400:
		var planet = Planet.instance()
		var rng = RandomNumberGenerator.new()
		rng.randomize()

		planet.position = Vector2(rng.randi_range(3000, 56000), rng.randi_range(3000, 56000))
		planet.z_index = 0
		var temp = rng.randi_range(5, 25) * .1
		planet.scale = Vector2(temp,temp)
		self.add_child(planet)
	for i in 400:
		var asteroid = Asteroid1.instance()
		var rng = RandomNumberGenerator.new()
		rng.randomize()

		asteroid.position = Vector2(rng.randi_range(3000, 56000), rng.randi_range(3000, 56000))
		asteroid.z_index = 0
		var temp = rng.randi_range(25, 50) * .1
		asteroid.scale = Vector2(temp,temp)
		self.add_child(asteroid)
	
func _process(delta):
	RightB.position.x = RightB.position.x - .55
	LeftB.position.x = LeftB.position.x + .55
	TopB.position.y = TopB.position.y + .55
	BottomB.position.y = BottomB.position.y - .55
	
func getVelocity():
	return Vector2(.1,.1)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
