extends Node

var tscnMeeleSwoosh = preload("res://MeeleSwoosh.tscn")
var tscnMagBall = preload("res://MagBall.tscn")
var tscnBloodParts = preload("res://BloodParticles.tscn")
var player: Player
var stop:bool = false

var game_over = false

var levels = []


func _ready():
	var file = File.new()
	
	for i in range(100):
		var filePath = "res://levels/Level" + str(i) + ".tscn"
		if file.file_exists(filePath):
			levels.append(load(filePath))


func reset():
	stop = false
	game_over = false
