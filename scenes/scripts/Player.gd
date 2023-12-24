extends KinematicBody2D

var SPEED = 300

func _ready():
	pass
	
func _process(delta):
	check_movement(delta)
	
func check_movement(delta):
	var dir = Vector2.ZERO
	dir.x = Input.get_action_strength("go_right") - Input.get_action_strength("go_left")
	dir.y = Input.get_action_strength("go_down") - Input.get_action_strength("go_up")
	move_and_slide(dir * SPEED * delta * 60)

	if Input.is_action_just_pressed("shoot"):
		print('shoot')
	
