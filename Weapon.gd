extends Node2D

onready var nodeSprite = $Sprite
onready var nodeTween = $Tween


var swingPos = "L"


func swing():
	nodeTween.remove_all()
	
	if swingPos == "L":
		nodeTween.interpolate_property(nodeSprite, "rotation", PI*0.7, PI*0.8)
		swingPos = "R"
	else:
		nodeTween.interpolate_property(nodeSprite, "rotation", -PI*0.7, -PI*0.8)
		swingPos = "L"
	
	nodeTween.start()
