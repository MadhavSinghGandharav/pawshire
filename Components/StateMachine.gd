extends Node
class_name StateMachine

@export var initial_state: State

var player: CharacterBody2D
var current_state: State
var states: Dictionary = {}

func _ready():
	player = get_parent()
	for state in get_children():
		if state is State:
			states[state.name.to_lower()] = state
			state.state_machine = self
			state.player = player
	
	if initial_state:
		change_state(initial_state.name.to_lower())

func _process(delta):
	if current_state:
		current_state.Update(delta)

func _physics_process(delta):
	if current_state:
		current_state.PhysicsUpdate(delta)
		current_state.Transition()

	

func change_state(state_name: String):
	if current_state:
		current_state.Exit()
	var new_state: State = states.get(state_name.to_lower())
	if new_state:
		new_state.Enter()
		current_state = new_state
		
