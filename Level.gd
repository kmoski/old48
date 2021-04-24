extends Node2D

onready var tscn = preload("res://EDog.tscn")


# Declare member variables here. Examples:
# var a = 2
# var b = "text

# Called when the node enters the scene tree for the first time.
func _ready():
	var new_dog = tscn.instance()
	new_dog.position = Vector2(400, 400)
	add_child(new_dog)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
