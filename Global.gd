extends Node

var tscnMeeleSwoosh = preload("res://MeeleSwoosh.tscn")
var tscnMagBall = preload("res://MagBall.tscn")
var player: Player

var levels = []


func _ready():
	var file = File.new()
	
	for i in range(10):
		var filePath = "res://levels/Level" + str(i) + ".tscn"
		if file.file_exists(filePath):
			levels.append(load(filePath))
