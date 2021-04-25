extends Node

onready var nodeBackEnv = $BackEnvironment
onready var nodeGame = $Game
onready var nodeLevel = $Game/Level


func _ready():
	nodeGame.connect("next_level", nodeBackEnv, "next_level")
