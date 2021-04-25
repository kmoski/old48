extends Node2D

onready var tscnEDog = preload("res://EDog.tscn")

onready var nodeEnemies = $Enemies
onready var nodeBalls = $MagBalls


# Declare member variables here. Examples:
# var a = 2
# var b = "text

# Called when the node enters the scene tree for the first time.
func _ready():
	for enemy in nodeEnemies.get_children():
		if enemy is EMag:
			enemy.connect("create_mag_ball", self, "add_ball")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#func add_enemy(enemy):
#	nodeEnemies.add_child(enemy)

func add_ball(ball):
	nodeBalls.add_child(ball)
