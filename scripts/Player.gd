extends KinematicBody2D

var SPEED = 300
const PRE_LASER = preload("res://scenes/Laser.tscn")
const PRE_SHINE = preload("res://scenes/Shine.tscn")
const TYPE = 'player'
var has_power_up = false
var start_pos
var is_alive = true
var respawning = false
var blinking = false
var can_shoot = true

func _ready():
	start_pos = position
	respawn()
	
func _process(delta):
	if blinking: blink()	
	if respawning:
		respawning(delta)	
	else: 
		check_movement(delta)
		if can_shoot: check_laser()
		
func check_movement(delta):
	var dir = Vector2.ZERO
	dir.x = Input.get_action_strength("go_right") - Input.get_action_strength("go_left")
	dir.y = Input.get_action_strength("go_down") - Input.get_action_strength("go_up")
	move_and_slide(dir * SPEED * delta * 60)

func check_laser():
	if Input.is_action_just_pressed("shoot"):
		shoot()
		shine()
		
func shoot():
	$LaserFX.play()
	var laser = PRE_LASER.instance()	
	get_parent().add_child(laser)
	laser.global_position = global_position
	laser.global_position.y = global_position.y - 30
	check_power_ups()
		
func check_power_ups():
	if has_power_up:
		shoot_left_laser()
		shoot_right_laser()

func shoot_left_laser():
	$LaserFX.play()
	var laser_left = PRE_LASER.instance()
	get_parent().add_child(laser_left)
	laser_left.global_position = $SpecialPositionsGroup/PositionLeft.global_position
	
func shoot_right_laser():
	$LaserFX.play()
	var laser_right = PRE_LASER.instance()
	get_parent().add_child(laser_right)
	laser_right.global_position = $SpecialPositionsGroup/PositionRight.global_position	
	
func shine():
	var shine = PRE_SHINE.instance()
	get_parent().add_child(shine)
	shine.position = position
	shine.position.y = position.y - 30
		
func die():
	can_shoot = false
	visible = false
	$TimerToRespawn.start()

func _on_TimerToRespawn_timeout():
	respawn()
	
func respawn():
	visible = true
	is_alive = true
	respawning = true
	position.x = start_pos.x
	position.y = start_pos.y + 200
	call_deferred('disable_collision')
	
func respawning(delta):
	if position.y <= start_pos.y:		
		stop_respawning()
	else:
		position.y -= SPEED * delta / 3
		blinking = true
	
func stop_respawning():
	respawning = false
	$TimerToRestart.start()
	
func _on_TimerToRestart_timeout():
	stop_blinking()
	call_deferred('enable_collision')
	can_shoot = true

func stop_blinking():
	blinking = false
	$Sprite.visible = true
	
func blink():
	$Sprite.visible = ! $Sprite.visible
	
func disable_collision():
	$CollisionPolygon2D.disabled = true
	$PlayerArea2D/CollisionPolygon2D2.disabled = true
	
func enable_collision():
	$CollisionPolygon2D.disabled = false
	$PlayerArea2D/CollisionPolygon2D2.disabled = false
	
func add_power_up():
	has_power_up = true
	$TimerOnPowerUP.start()

func _on_TimerOnPowerUP_timeout():
	has_power_up = false
	
