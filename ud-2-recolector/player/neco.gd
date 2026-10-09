extends CharacterBody2D

@export var speed: float = 80.0
@export var idle_time: float = 10.0

@onready var anim = $AnimatedSprite2D

var idle_timer: float = 0.0
var long_idle_started: bool = false

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector(
		"ui_left", "ui_right",
		"ui_up", "ui_down"
	)

	velocity = direction * speed
	move_and_slide()

	# Girar según la dirección
	if direction.x < 0:
		anim.flip_h = true
	elif direction.x > 0:
		anim.flip_h = false

	# Controlar el tiempo sin moverse
	if direction != Vector2.ZERO:
		idle_timer = 0.0
		long_idle_started = false
		anim.play("walk")
	else:
		idle_timer += delta

		if idle_timer >= idle_time:
			if not long_idle_started:
				anim.play("idle_long")
				long_idle_started = true
		else:
			anim.play("idle")
