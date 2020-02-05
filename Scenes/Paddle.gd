extends KinematicBody2D

func _physics_process(_delta):
	var y = position.y
	var x = get_viewport().get_mouse_position().x
	
	position = Vector2(x, y)
