extends Enemy

func _ready():
	pass

func _physics_process(delta):
	if health < 20:
		move_to(player, delta)
	else:
		move_from(player, delta)
