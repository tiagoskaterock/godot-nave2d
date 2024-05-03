extends Area2D

var speed = 700
const LIMIT = -50
const TYPE = 'laser'
const PRE_FART = preload("res://scenes/FartSound.tscn")

func _process(delta):
	move(delta)
	check_limit()

func move(delta):
	position.y -= speed * delta	
	
func check_limit():
	if position.y < LIMIT: queue_free()
	
func _on_Laser_area_entered(area):	
	if area.TYPE == 'enemy':		
		die()
	if area.TYPE == 'powerup':
		var fart = PRE_FART.instance()
		get_parent().add_child(fart)
		die()
		
func die():
	queue_free()
