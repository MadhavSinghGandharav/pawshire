extends State

@export var animated_sprite_2d: AnimatedSprite2D
@export var run_speed: float = 15.0
var direction: Vector2

func PhysicsUpdate(delta):
	direction = player.current_direction
	
	player.movement.velocity = direction * run_speed
	player.movement.move(player,delta)
	


func Update(delta: float):
	if direction == Vector2.UP:
		animated_sprite_2d.play("run_back")
	elif direction == Vector2.DOWN:
		animated_sprite_2d.play("run_front")
	elif direction == Vector2.LEFT:
		animated_sprite_2d.play("run_right")
	elif direction == Vector2.RIGHT:
		animated_sprite_2d.play("run_right")
		
func Transition():
	if !player.is_moving:
	
		state_machine.change_state("idle")
	
func Exit():
	animated_sprite_2d.stop()

func Enter():
	pass
