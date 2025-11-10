extends CharacterBody2D


@onready var movement = $MovementComponent
@onready var input = $InputComponent

var current_direction: Vector2 = Vector2.DOWN
var is_moving: bool

func _ready():
	# connect input signal -> FSM or movement
	input.movement_input.connect(_on_movement_input)
	is_moving = false

func _on_movement_input(dir: Vector2):
	# you can send this to FSMinput
	if dir != Vector2.ZERO:
		current_direction = dir
		is_moving = true
	else:
		is_moving = false
