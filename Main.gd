extends Node

onready var nodeBackEnv = $BackEnvironment
onready var nodeGame = $Game
onready var nodeLevel = $Game/Level
onready var nodeGameOver = $UI/GameOver
onready var nodeGameCompleted = $UI/GameCompleted



func _ready():
	nodeGame.connect("next_level", nodeBackEnv, "next_level")
	
	nodeGame.connect("game_completed", self, "game_completed")
	nodeGame.connect("game_over", self, "game_over")
	


func game_over():
	nodeGameOver.visible = true
	#Global.player.queue_free()
	
	
func game_completed():
	nodeGameCompleted.visible = true
