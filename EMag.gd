extends Enemy

class_name EMag


var attack_direction

signal create_mag_ball(ballInst)

func _ready():
	pass

func _physics_process(delta):
	if near(player.position, 100):
		move_from(player.position, delta)
	elif !near(player.position, 300):
		move_to(player.position, delta)
	
	if delay_enable:
		current_attack_delay -= 1
		if current_attack_delay <= 0:
			delay_enable = false
	else:
		spawn_ball()
		delay_enable = true
		current_attack_delay = attack_delay
	
func spawn_ball():
	var new_ball = Global.tscnMagBall.instance()
	new_ball.position = position
	new_ball.rotation = position.angle_to_point(player.position)
	emit_signal("create_mag_ball", new_ball)
