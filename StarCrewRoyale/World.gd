extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var LeftB = $LeftBounds
onready var RightB = $RightBounds
onready var TopB = $TopBounds
onready var BottomB = $BottomBounds
onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	RightB.position.x = RightB.position.x - .5
	LeftB.position.x = LeftB.position.x + .5
	TopB.position.y = TopB.position.y + .5
	BottomB.position.y = BottomB.position.y - .5
	
	
func _physics_process(delta):
	RightB.position.x = RightB.position.x - 1
	LeftB.position.x = LeftB.position.x + 1
	TopB.position.y = TopB.position.y + 1
	BottomB.position.y = BottomB.position.y - 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
