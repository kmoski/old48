extends Enemy

class_name EMag

var attack_direction
onready var nodeAnimPlayer = $AnimationPlayer

signal create_mag_ball(ballInst)

func _ready():
	pass

func _physics_process(delta):
	if Global.stop:
		return
	
	if health <= 0:
		nodeAnimPlayer.play("death")
		die()
		return
	
	if in_stan():
		nodeAnimPlayer.play("idle")
		return
	
	if near(Global.player.position, 100):
		move_from(Global.player.position, delta)
		nodeAnimPlayer.play("run")
	elif !near(Global.player.position, 300):
		move_to(Global.player.position, delta)
		nodeAnimPlayer.play("run")
	else:
		nodeAnimPlayer.play("idle")
	
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
	new_ball.rotation = position.angle_to_point(Global.player.position)
	emit_signal("create_mag_ball", new_ball)
