extends Area2D

onready var nodeTween = $Tween
onready var collisionPoligon = $CollisionPolygon2D

var lifeTime = 0.5
var moveDist = 100
var damage = 30
var kill = false

func _ready():
	nodeTween.interpolate_property(self, "modulate", modulate, Color.transparent, lifeTime, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	
	var endPos = position + Vector2(1, 0).rotated(rotation) * moveDist
	nodeTween.interpolate_property(self, "position", position, endPos, lifeTime)
	nodeTween.start()
	
	yield(nodeTween, "tween_completed")
	queue_free()



func _on_MeeleSwoosh_body_entered(body):
	if !kill:
		if body is Enemy:
			body.decrease_health(damage)
			kill = false
