extends KinematicBody2D

onready var right = $Right
onready var left = $Left
onready var top = $Up
onready var bottom = $Down

func crash():
	right.crash()
	left.crash()
	top.crash()
	bottom.crash()

