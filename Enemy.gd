extends KinematicBody2D

class_name Enemy

onready var player = get_node("../Player")
export var speed = 400
export var health = 200

func move_to(node:Node2D, delta):
	var velocity = self.position.direction_to(node.position)
	move_and_collide(velocity * speed * delta)

func move_from(node:Node2D, delta):
	var velocity = self.position.direction_to(node.position)
	move_and_collide(-velocity * speed * delta)

func decrease_health(damage):
	health -= damage
