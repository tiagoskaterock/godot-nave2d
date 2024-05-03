extends AudioStreamPlayer2D

func _on_FartSound_finished():
	queue_free()
