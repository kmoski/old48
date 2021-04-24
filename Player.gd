extends KinematicBody2D


onready var nodeAnimPlayer = $AnimationPlayer
onready var nodeArms = $Arms
onready var nodeWeapon = $Arms/Weapon
onready var nodeSprite = $Sprite


var moveVec = Vector2()
var moveMaxSpeed = 350
var moveAcc = 2500
var moveDec = 2500

var rotAng = 0.0


func _ready():
	pass


func _physics_process(delta):
	
	# moving
	var inpVec = Vector2()
	
	if Input.is_action_pressed("player_left"):
		inpVec.x -= 1
	if Input.is_action_pressed("player_right"):
		inpVec.x += 1
	if Input.is_action_pressed("player_up"):
		inpVec.y -= 1
	if Input.is_action_pressed("player_down"):
		inpVec.y += 1
	
	if inpVec.length() == 0:
		moveVec = moveVec.normalized() * clamp(moveVec.length() - moveDec * delta, 0, moveMaxSpeed)
	else:
		inpVec = inpVec.normalized()
		moveVec += inpVec * moveAcc * delta
		moveVec = moveVec.clamped(moveMaxSpeed)
	
	move_and_slide(moveVec)
	set_animation()


func set_animation():
	if moveVec.length() > 0:
		nodeAnimPlayer.play("Run")
	else:
		nodeAnimPlayer.play("Idle")


func _input(event):
	if event is InputEventMouseMotion:
		# weapon rotation
		rotAng = global_position.angle_to_point(event.global_position) + PI
		nodeArms.rotation = rotAng
		
		# player sprite flipping
		nodeSprite.flip_h = not (global_position > event.global_position)

	if event.is_action_pressed("player_atack"):
		nodeWeapon.swing()

func decrease_health(damage):
	pass
