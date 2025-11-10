extends Node
class_name InputComponent

signal movement_input(direction: Vector2)


func _physics_process(delta: float) -> void:
	var dir = Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down")
	movement_input.emit(dir)
	
	
