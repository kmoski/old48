extends Node


onready var nodeAnimPlayer = $AnimationPlayer


func next_level():
	nodeAnimPlayer.play("NextRoom")
