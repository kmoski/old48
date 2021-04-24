extends Enemy

func _ready():
	pass

func _physics_process(delta):
	if health < 20:
		move_from(player.position, delta)
		speed = 100
	else:
		move_to(player.position, delta)
	
	if near(player, 50):
		if now_attack:
			--current_attack_delay
			if current_attack_delay <= 0:
				now_attack = false
		else:
			now_attack = true
			current_attack_delay = attack_delay
			attack(player, damage)
