extends Area2D

var SCREEN_LIMIT = 850
var speed = 200
const TYPE = 'enemy'
const PRE_ENEMY_EXPLOSION = preload("res://scenes/EnemyExplosion.tscn")
	
func _process(delta):
	position.y += speed * delta
	check_limit()
	
func _on_Enemy_area_entered(area):
	if area.TYPE == 'laser':
		die()
		
func die():
	get_parent().add_ponto()
	var explosion = PRE_ENEMY_EXPLOSION.instance()
	explosion.position = position
	get_parent().add_child(explosion)
	queue_free()

func check_limit():
	if position.y > SCREEN_LIMIT:
		queue_free()

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "exploding":
		queue_free()
