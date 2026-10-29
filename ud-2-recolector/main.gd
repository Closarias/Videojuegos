extends Node2D

var points := 0
var total := 0

func _ready() -> void:
	var coins := get_tree().get_nodes_in_group("coins")
	total = coins.size()
	for coin in coins:
		coin.collected.connect(_on_coin_collected)
	_update_score()

func _on_coin_collected() -> void:
	points += 1
	_update_score()

func _update_score() -> void:
	$HUD/Score.text = "Coins: %d / %d" % [points, total]

func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()
