extends AnimatedSprite
const PRE_SOUND = preload("res://scenes/EnemyExplosionSound.tscn")

func _ready():
	var sound = PRE_SOUND.instance()
	get_parent().add_child(sound)	
	play("exploding")
	
func _on_EnemyExplosion_animation_finished():
	queue_free()
