extends StaticBody2D
var screen_size
var MOVEMENT_SPEED = 5


func _ready():
	screen_size = get_viewport_rect().size


func _process(delta):
	var ball = get_tree().get_first_node_in_group("ball") as CharacterBody2D
	if ball == null:
		# Make sure to stop moving when there is no ball in the game
		return
	var target_position = ball.global_position

	global_position.y = global_position.lerp(target_position, 1.0 - exp(-delta * MOVEMENT_SPEED)).y
	global_position.clamp(Vector2.ZERO, screen_size)
