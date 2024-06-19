extends CharacterBody2D
var screen_size
var bounce_sound = AudioStreamPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2(300, 300)
	screen_size = get_viewport_rect().size
	bounce_sound = $BounceSound


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collision_data = move_and_collide(velocity * delta)

	if collision_data:
		var collider = collision_data.get_collider().to_string()
	
		velocity.y += 50
		velocity.x += 50
		velocity = velocity.bounce(collision_data.get_normal())
		if collider.contains("Paddle"):
			bounce_sound.play()

	if global_position.x > screen_size.x || global_position.x < 0:
		queue_free()
