extends Node2D

var points := 0
var total := 0


func _ready() -> void:
	var pearls := get_tree().get_nodes_in_group("pearls")
	total = pearls.size()
	for pearl in pearls:
		pearl.collected.connect(_on_pearl_collected)
	_update_score()


func _on_pearl_collected() -> void:
	points += 1
	_update_score()


func _update_score() -> void:
	$HUD/Score.text = "Pearls: %d / %d" % [points, total]


func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()
