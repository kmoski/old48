extends Node2D

onready var nodeLevel = $Level
onready var nodeParticles = $Particles

var curLevelIdx = 0

signal next_level
signal game_completed
signal game_over


func _ready():
	Global.player = $Player
	nodeLevel.connect("level_ended", self, "next_level")
	nodeLevel.connect("level_ended", Global.player, "jump_to_next_level")
	
	Global.player.connect("dead", self, "player_dead")


func next_level():
	nodeLevel.queue_free()
	
	curLevelIdx += 1
	emit_signal("next_level")
	
	if Global.levels.size() - 1 >= curLevelIdx:
		nodeLevel = Global.levels[curLevelIdx].instance()
		nodeLevel.connect("level_ended", self, "next_level")
		nodeLevel.connect("level_ended", Global.player, "jump_to_next_level")
		add_child(nodeLevel)
	
	else:
		emit_signal("game_completed")


func create_particles(instance):
	nodeParticles.add_child(instance)


func player_dead():
	emit_signal("game_over")
	Global.game_over = true


func _input(event):
	if event.is_action_pressed("restart_game") and Global.game_over:
		get_tree().reload_current_scene()
		Global.reset()
