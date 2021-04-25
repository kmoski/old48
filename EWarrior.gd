extends Enemy

class_name EWarrior

var start_attack := false
var attack_direction

func _ready():
	pass

func _physics_process(delta):
	if delay_enable:
		current_attack_delay -= 1
		if current_attack_delay <= 0:
			delay_enable = false
	else:
		if near(Global.player.position, 200):
			if start_attack:
				attack_player(delta)
#				if near(attack_direction, 5):
#					start_attack = false
#					print("stop")
#					# attack delay
#					delay_enable = true
#					current_attack_delay = attack_delay
			else:
				# атака начинается
				start_attack = true
				attack_direction = self.position.direction_to(Global.player.position)
				attack_player(delta)
		else:
			if start_attack:
				start_attack = false
				# attack delay
				delay_enable = true
				current_attack_delay = attack_delay
			# игрок вне поля начала атаки
			start_attack = false
			if health < 30:
				speed = 150
			else:
				speed = 240
			move_to(Global.player.position, delta)

func attack_player(delta):
	speed = 1000
	move_and_collide(attack_direction * speed * delta)

func _on_Area2D_body_entered(body):
	if body is Player:
		body.decrease_health(damage)
