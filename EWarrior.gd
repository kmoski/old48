extends Enemy

var start_attack := false
var attack_direction

func _ready():
	pass

func _physics_process(delta):
#	if near(player, 1000):
#
#
#
#	if health < 30:
#		speed = 150
#	else:
#		speed = 240
#
#	if near(player, 1000):
#		if !start_attack:
#			start_attack = true
#			attack_direction = player.position
#			speed = 500
#	else:
#		start_attack = false
#		if health < 30:
#			speed = 150
#		else:
#			speed = 240
#
#	if start_attack:
#		if near(player, 20):
#			if now_attack:
#				move_to(attack_direction, delta)
#				--current_attack_delay
#				if current_attack_delay <= 0:
#					now_attack = false
#			else:
#				now_attack = true
#				current_attack_delay = attack_delay
#				attack(player, damage)
#	else:
#		move_to(player.position, delta)
