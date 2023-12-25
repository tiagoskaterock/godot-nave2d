extends Area2D

const SCREEN_LIMIT = 850
var speed = 200
const TYPE = 'enemy'

func _ready():
	pass
	
func _process(delta):
	position.y += speed * delta
	check_limit()
	
func _on_Enemy_area_entered(area):
	if area.TYPE == 'laser':
		die()
		
func die():
	queue_free()

func check_limit():
	if position.y > SCREEN_LIMIT:
		die()
