extends Node2D

const PREV_ENEMY = preload("res://scenes/Enemy.tscn")

func _ready():
	$TimertoSpawnEnemy.start()	

func spawn_enemy():
	var enemy = PREV_ENEMY.instance()
	add_child(enemy)
	enemy.global_position = Vector2(get_random_x(), -50)
	$TimertoSpawnEnemy.wait_time = rand_range(.2, 3)

func _on_TimertoSpawnEnemy_timeout():
	spawn_enemy()
	
func get_random_x():
	return int(rand_range(30, get_viewport().get_visible_rect().size.x - 30))
