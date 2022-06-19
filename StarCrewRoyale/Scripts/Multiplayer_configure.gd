extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var OnePB = $"1Player2"
onready var ThreePB = $"3Player"
onready var Background = $Sprite
var TwoPlayerWorld = preload("res://Scenes/2pWorld.tscn").instance()
var OnePlayerWorld = preload("res://Scenes/1pWorld.tscn").instance()
var ThreePlayerWorld = preload("res://Scenes/World.tscn").instance()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_2Player_pressed():
	get_tree().get_root().add_child(TwoPlayerWorld)
	OnePB.visible = false
	ThreePB.visible = false
	Background.visible = false

func _on_1Player2_pressed():
	get_tree().get_root().add_child(OnePlayerWorld)
	OnePB.visible = false
	ThreePB.visible = false
	Background.visible = false

func _on_3Player_pressed():
	get_tree().get_root().add_child(ThreePlayerWorld)
	ThreePB.visible = false
	OnePB.visible = false
	Background.visible = false
