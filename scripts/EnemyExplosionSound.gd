extends AudioStreamPlayer2D

func _on_EnemyExplosionSound_finished():
	queue_free()
