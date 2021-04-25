extends KinematicBody2D

class_name Enemy

export var speed = 1
export var health = 1
export var damage = 1
export var attack_delay = 1
var delay_enable := false
var current_attack_delay
var stan = false
var stan_delay = 30
var current_stan_delay:int
var died = false

signal died
signal create_particles

func _ready():
	delay_enable = false
	pass

func move_to(target_position, delta):
	var velocity = self.position.direction_to(target_position)
	move_and_collide(velocity * speed * delta)

func move_from(target_position, delta):
	var velocity = self.position.direction_to(target_position)
	move_and_collide(-velocity * speed * delta)

func decrease_health(damage):
	health -= damage
	stan = true
	current_stan_delay = stan_delay

func die():
	died = true
	emit_signal("died")
	
	var newParticles = Global.tscnBloodParts.instance()
	newParticles.position = global_position
	emit_signal("create_particles", newParticles)

func in_stan() -> bool:
	if stan:
		current_stan_delay -= 1
	return current_stan_delay > 0

func attack(target, damage):
	target.decrease_health(damage)

func near(target_position, distance) -> bool:
	var current_distance = self.position.distance_to(target_position)
	return current_distance <= distance
