extends Node2D

onready var nodeEnemies = $Enemies
onready var nodeBalls = $MagBalls

var enemiesCount = 10

signal level_ended


func _ready():
	for enemy in nodeEnemies.get_children():
		if enemy is EMag:
			enemy.connect("create_mag_ball", self, "add_ball")


func add_ball(ball):
	nodeBalls.add_child(ball)


func enemy_destroyed():
	if enemiesCount == 0:
		emit_signal("level_ended")


func _input(event):
	if event.is_action_pressed("next_level"):
		emit_signal("level_ended")
