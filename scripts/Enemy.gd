extends Area2D

var SCREEN_LIMIT = 850
var speed = 200
const TYPE = 'enemy'

func _ready():
	$AnimatedSprite.play("default")
	
func _process(delta):
	position.y += speed * delta
	check_limit()
	
func _on_Enemy_area_entered(area):
	if area.TYPE == 'laser':
		die()
		
func die():
	$AnimatedSprite.play("exploding")

func check_limit():
	if position.y > SCREEN_LIMIT:
		die()

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "exploding":
		queue_free()
