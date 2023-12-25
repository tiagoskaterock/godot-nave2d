extends KinematicBody2D

var SPEED = 300
const PRE_LASER = preload("res://scenes/Laser.tscn")
const TYPE = 'player'
var has_power_up = false

func _ready():
	pass
	
func _process(delta):
	check_movement(delta)
	check_laser()
	
func check_movement(delta):
	var dir = Vector2.ZERO
	dir.x = Input.get_action_strength("go_right") - Input.get_action_strength("go_left")
	dir.y = Input.get_action_strength("go_down") - Input.get_action_strength("go_up")
	move_and_slide(dir * SPEED * delta * 60)

func check_laser():
	if Input.is_action_just_pressed("shoot"):
		var laser = PRE_LASER.instance()
		get_parent().add_child(laser)
		laser.global_position = global_position
		laser.global_position.y = global_position.y - 30
		
func die():
	queue_free()
	
func add_power_up():
	has_power_up = true
	print('add_power_up')
