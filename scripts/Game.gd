extends Node2D

const PREV_ENEMY = preload("res://scenes/Enemy.tscn")
const PREV_POWER_UP = preload("res://scenes/PowerUP.tscn")
var _pontos: int = 0
var _lives: int = 3
var _level: int = 0

func _ready():
	$TimertoSpawnEnemy.start()
	$TimerToSpawnPowerUP.start()
	update_label_pontos()
	update_label_lives()

func spawn_enemy():
	var enemy = PREV_ENEMY.instance()
	add_child(enemy)
	enemy.global_position = Vector2(get_random_x(), -50)
	$TimertoSpawnEnemy.wait_time = rand_range(.2, 1)

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
	
func get_pontos() -> int:
	return _pontos
	
func add_ponto() -> void:
	_pontos += 1
	update_label_pontos()
	
func update_label_pontos() -> void:
	var label_pontos = get_node("Hud").get_node("LabelPontos")
	label_pontos.text = 'Points:' + str(get_pontos())
	
func get_lives() -> int:
	return _lives
	
func lose_life() -> void:
	_lives -= 1
	update_label_lives()
	
func update_label_lives() -> void:
	var label_lives = get_node("Hud").get_node("LabelVidas")
	label_lives.text = 'Lives:' + str(get_lives())


func _on_RockSong_finished():
	get_tree().change_scene("res://scenes/Stage_02.tscn")
