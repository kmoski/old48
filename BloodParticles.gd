extends Area2D


var moveSpeed = 300


func _physics_process(delta):
	position += Vector2(-1, 0).rotated(position.angle_to_point(Global.player.global_position)) * moveSpeed * delta


func _on_BloodParticles_body_entered(body):
	if body is Player:
		queue_free()
