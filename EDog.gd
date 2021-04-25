extends Enemy

class_name EDog

func _ready():
	pass

func _physics_process(delta):
	if !delay_enable:
		if health < 20:
			move_from(player.position, delta)
			speed = 100
			# todo 
		else:
			move_to(player.position, delta)
	else:
		current_attack_delay -= 1
		if current_attack_delay <= 0:
			delay_enable = false
	
	if near(player.position, 50):
		if !delay_enable:
			delay_enable = true
			current_attack_delay = attack_delay
			attack(player, damage)
