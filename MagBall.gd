extends Area2D

class_name MagBall

export var speed = 1000
export var lifeTime = 1
export var kill_distance = 5
export var damage = 30

onready var nodeTimer = $Timer

func _ready():
	nodeTimer.start(lifeTime)
	yield(nodeTimer, "timeout")
	queue_free()

func _physics_process(delta):
	position += Vector2(-1, 0).rotated(rotation) * speed * delta


func _on_MagBall_body_entered(body):
	if body is Player:
		body.decrease_health(damage)
		queue_free()
