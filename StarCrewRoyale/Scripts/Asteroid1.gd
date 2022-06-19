extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = Vector2()

func _process(delta):

	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = collision.collider_velocity
