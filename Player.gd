extends KinematicBody2D

class_name Player

onready var nodeAnimPlayer = $AnimationPlayer
onready var nodeArms = $Arms
onready var nodeWeapon = $Arms/Weapon
onready var nodeSprite = $Sprite
onready var nodeTween = $Tween

var moveVec = Vector2()
var moveMaxSpeed = 350
var moveAcc = 2500
var moveDec = 2500

var rotAng = 0.0


enum STATES {
	IDLE, RUN, JUMP_TO_NEXT_LEVEL
}
export var curState = STATES.IDLE


func _ready():
	pass


func _physics_process(delta):
	
	if curState == STATES.JUMP_TO_NEXT_LEVEL:
		return
	
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
	set_state()


func set_state():
	if curState == STATES.JUMP_TO_NEXT_LEVEL:
		return
	
	if moveVec.length() > 0:
		curState = STATES.RUN
		nodeAnimPlayer.play("Run")
	else:
		curState = STATES.IDLE
		nodeAnimPlayer.play("Idle")


func jump_to_next_level():
	curState = STATES.JUMP_TO_NEXT_LEVEL
	nodeAnimPlayer.play("JumpToNextLevel")


func _input(event):
	
	if curState == STATES.JUMP_TO_NEXT_LEVEL:
		return
	
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
