extends Area2D

var speed = 700
const LIMIT = -50

func _process(delta):
	move(delta)
	check_limit()

func move(delta):
	position.y -= speed * delta	
	
func check_limit():
	if position.y < LIMIT: queue_free()	
	
