extends Enemy

class_name EDog

onready var nodeAnimPlayer = $AnimationPlayer

func _ready():
	pass

func _physics_process(delta):
	if Global.stop:
		return
	
	if health <= 0:
		nodeAnimPlayer.play("death")
		if !died:
			die()
		return
	
	if in_stan():
		nodeAnimPlayer.play("idle")
		return
	
	if !delay_enable:
		if health < 20:
			speed = 100
			move_to(Global.player.position, delta)
			nodeAnimPlayer.play("run")
			# todo 
		else:
			move_to(Global.player.position, delta)
			nodeAnimPlayer.play("run")
	else:
		current_attack_delay -= 1
		nodeAnimPlayer.play("idle")
		if current_attack_delay <= 0:
			delay_enable = false
	
	if near(Global.player.position, 50):
		if !delay_enable:
			delay_enable = true
			current_attack_delay = attack_delay
			attack(Global.player, damage)
