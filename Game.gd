extends Node2D


onready var nodeLevels: Array
onready var nodeLevel = $Level

signal next_level


func _ready():
	nodeLevel.connect("level_ended", self, "next_level")


func next_level():
	emit_signal("next_level")
