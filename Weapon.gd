extends Node2D

onready var nodeSprite = $Sprite
onready var nodeTween = $Tween
onready var nodeSwooshSpawnPoint = $SwooshSpawnPoint

var swingPos = "L"


func _physics_process(delta):
	get_parent().show_behind_parent = (nodeSprite.global_rotation > -PI and nodeSprite.global_rotation < 0) or nodeSprite.global_rotation > PI


func swing():
	# play swing animation
	nodeTween.remove_all()
	
	if swingPos == "L":
		nodeTween.interpolate_property(nodeSprite, "rotation", PI*0.5, PI*0.7, 0.3, Tween.TRANS_CUBIC, Tween.EASE_OUT)
		swingPos = "R"
	else:
		nodeTween.interpolate_property(nodeSprite, "rotation", -PI*0.5, -PI*0.7, 0.3, Tween.TRANS_CUBIC, Tween.EASE_OUT)
		swingPos = "L"
	
	nodeTween.start()
	
	# create swoosh
	var swoosh = Global.tscnMeeleSwoosh.instance()
	swoosh.position = nodeSwooshSpawnPoint.global_position
	swoosh.rotation = global_rotation
	get_tree().get_root().add_child(swoosh)
