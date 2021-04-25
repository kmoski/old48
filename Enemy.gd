extends KinematicBody2D

class_name Enemy

onready var player = get_node("../../Player")
export var speed = 1
export var health = 1
export var damage = 1
export var attack_delay = 1
var delay_enable := false
var current_attack_delay

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

func attack(target, damage):
	target.decrease_health(damage)

func near(target_position, distance) -> bool:
	var current_distance = self.position.distance_to(target_position)
	return current_distance <= distance
