extends Area2D

const TYPE = 'player'

func _ready():
	pass

func _on_PlayerArea2D_area_entered(area):
	if area.TYPE == 'powerup': $SuccesFX.play()
	if area.TYPE == 'enemy': 
		get_parent().die()

	
