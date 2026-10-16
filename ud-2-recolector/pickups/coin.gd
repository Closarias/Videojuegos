extends Area2D

signal collected

func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return
	set_deferred("monitoring", false)
	$Sprite2D.hide()
	$Sound.play()
	collected.emit()
	await $Sound.finished
	queue_free()
