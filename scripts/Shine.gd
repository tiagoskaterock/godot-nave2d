extends Node2D

func _ready():
	$AnimationPlayer.play("Shine")

func _on_AnimationPlayer_animation_finished(Shine):	
	die()

func die():
	queue_free()
