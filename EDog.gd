extends Enemy

class_name EDog

onready var nodeAnimPlayer = $AnimationPlayer

func _ready():
	pass

func _physics_process(delta):
	if !delay_enable:
		if health < 20:
			move_from(Global.player.position, delta)
			nodeAnimPlayer.play("run")
			speed = 100
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
