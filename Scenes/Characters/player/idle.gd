extends State

@export var animated_sprite_2d: AnimatedSprite2D

func PhysicsUpdate(delta):
	pass

func Update(delta: float):
	if player.current_direction == Vector2.UP:
		animated_sprite_2d.play("idle_back")
	elif player.current_direction == Vector2.DOWN:
		animated_sprite_2d.play("idle_front")
	elif player.current_direction == Vector2.LEFT:
		animated_sprite_2d.play("idle_right")
	elif player.current_direction == Vector2.RIGHT:
		animated_sprite_2d.play("idle_right")
		
func Transition():
	if player.is_moving:
		state_machine.change_state("run")
	
func Exit():
	animated_sprite_2d.stop()

func Enter():
	pass
