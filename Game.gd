extends Node2D

onready var nodeLevel = $Level

signal next_level


func _ready():
	Global.player = $Player
	nodeLevel.connect("level_ended", self, "next_level")
	nodeLevel.connect("level_ended", Global.player, "jump_to_next_level")


func next_level():
	emit_signal("next_level")
	nodeLevel.queue_free()
	
	#load("res://levels/Level0.tscn")
