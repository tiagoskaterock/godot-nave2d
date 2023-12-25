extends Node2D

const PREV_ENEMY = preload("res://scenes/Enemy.tscn")
const PREV_POWER_UP = preload("res://scenes/PowerUP.tscn")

func _ready():
	$TimertoSpawnEnemy.start()
	$TimerToSpawnPowerUP.start()

func spawn_enemy():
	var enemy = PREV_ENEMY.instance()
	add_child(enemy)
	enemy.global_position = Vector2(get_random_x(), -50)
	$TimertoSpawnEnemy.wait_time = rand_range(.2, 3)

func _on_TimertoSpawnEnemy_timeout():
	spawn_enemy()
	
func get_random_x():
	return int(rand_range(30, get_viewport().get_visible_rect().size.x - 30))

func _on_TimerToSpawnPowerUP_timeout():
	spawn_power_up()
	
func spawn_power_up():
	var power_up = PREV_POWER_UP.instance()
	add_child(power_up)
	power_up.global_position = Vector2(get_random_x(), -50)	
