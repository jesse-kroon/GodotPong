extends StaticBody2D
var screen_size
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var ball = get_tree().get_first_node_in_group("ball") as CharacterBody2D
	if ball == null:
		return
	var target_position = ball.global_position

	global_position.y = global_position.lerp(target_position, 1.0 - exp(-delta * 350)).y
	global_position.clamp(Vector2.ZERO, screen_size)
