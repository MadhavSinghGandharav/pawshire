extends Node
class_name MovementComponent

@export var velocity = Vector2.ZERO

func move(entity: CharacterBody2D, _delta: float):
	if entity:
		entity.velocity = velocity
		entity.move_and_slide()
