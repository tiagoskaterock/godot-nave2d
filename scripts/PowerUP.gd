extends Area2D

const TYPE = "powerup"
const SPEED = 300
var SCREEN_LIMIT = 850

func _ready():
	pass

func _process(delta):
	check_limit()
	position.y += SPEED * delta
	
func check_limit():
	if position.y > SCREEN_LIMIT:
		die()	

func _on_PowerUP_area_entered(area):		
	if area.TYPE == 'player':
		var player = area.get_parent()
		player.add_power_up()
		die()
	if area.TYPE == 'laser':
		die()
		
func die():
	queue_free()
