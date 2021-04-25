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


func next_level():
	nodeLevel.queue_free()
	
	curLevelIdx += 1
	emit_signal("next_level")
	
	if Global.levels.size() - 1 >= curLevelIdx:
		nodeLevel = Global.levels[curLevelIdx].instance()
		add_child(nodeLevel)
	
	else:
		emit_signal("game_completed")


func create_particles(instance):
	nodeParticles.add_child(instance)
