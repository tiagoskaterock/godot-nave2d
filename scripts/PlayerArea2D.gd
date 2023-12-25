extends Area2D

const TYPE = 'enemy'

func _ready():
	pass

func _on_PlayerArea2D_area_entered(area):
	if area.name == 'Enemy': 
		get_parent().die()
	
