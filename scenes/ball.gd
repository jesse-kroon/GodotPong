extends CharacterBody2D
@export var particle_effect_scene: PackedScene
var screen_size
var bounce_sound: AudioStreamPlayer


func _ready():
	velocity = Vector2(500, 500)
	screen_size = get_viewport_rect().size
	bounce_sound = $BounceSound


func _process(delta):
	var collision_data = move_and_collide(velocity * delta)

	if collision_data:
		var collider = collision_data.get_collider()
		var collision_position = collision_data.get_position()

		velocity = velocity.bounce(collision_data.get_normal())
		if collider.to_string().contains("Paddle"):
			bounce_sound.play()
			var particle_effect = particle_effect_scene.instantiate() as CPUParticles2D 
			particle_effect.global_position = collision_position
			get_parent().add_child(particle_effect)
			particle_effect.emitting = true

	if global_position.x > screen_size.x || global_position.x < 0:
		# Need to do score assignment here
		# And spawn a new ball after a timer timeout
		queue_free()
