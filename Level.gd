extends Node2D

onready var nodeEnemies = $Enemies
onready var nodeBalls = $MagBalls

signal level_ended


func _ready():
	for enemy in nodeEnemies.get_children():
		if enemy is EMag:
			enemy.connect("create_mag_ball", self, "add_ball")


func add_ball(ball):
	nodeBalls.add_child(ball)


func enemy_destroyed():
	pass
