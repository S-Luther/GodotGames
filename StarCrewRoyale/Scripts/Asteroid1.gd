extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var velocity = Vector2()
var prevelocity = Vector2()
func _process(delta):

	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider_velocity == Vector2.ZERO:
			
			velocity = prevelocity*collision.get_angle()
		else:	
			velocity = collision.collider_velocity
			print(collision.collider_rid)
			print(collision.collider_metadata)
			print(collision.collider_shape)

	prevelocity = -velocity
		
