extends RigidBody2D

export var speedup = 400
export var maxspeed = 30000

func _physics_process(delta):	
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.is_in_group("Bricks"):
			body.queue_free()

		elif body.name == "Paddle":
			var speed = linear_velocity.length()
			var direction = position - body.get_node("Anchor").global_position
			var velocity = direction.normalized() * min(speed + speedup * delta, maxspeed * delta)
			linear_velocity = velocity

	if position.y > get_viewport_rect().end.y:
		queue_free()
