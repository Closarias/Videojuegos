extends CharacterBody2D

## Velocidad en píxeles por segundo. Se cambia desde el Inspector.
@export var speed: float = 80.0


func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed
	move_and_slide()
