extends Enemy

func _ready():
	pass

func _physics_process(delta):
	if health < 20:
		move_from(player.position, delta)
		speed = 100
	else:
		move_to(player.position, delta)
	
	if near(player.position, 50):
		if delay_enable:
			current_attack_delay -= 1
			if current_attack_delay <= 0:
				delay_enable = false
		else:
			delay_enable = true
			current_attack_delay = attack_delay
			attack(player, damage)
