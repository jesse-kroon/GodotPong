extends CharacterBody2D
var screen_size
var bounce_sound = AudioStreamPlayer


func _ready():
	velocity = Vector2(500, 500)
	screen_size = get_viewport_rect().size
	bounce_sound = $BounceSound


func _process(delta):
	var collision_data = move_and_collide(velocity * delta)

	if collision_data:
		var collider = collision_data.get_collider().to_string()
	
		velocity = velocity.bounce(collision_data.get_normal())
		if collider.contains("Paddle"):
			bounce_sound.play()

	if global_position.x > screen_size.x || global_position.x < 0:
		# Need to do score assignment here
		queue_free()
