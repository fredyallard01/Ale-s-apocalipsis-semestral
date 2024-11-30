extends CharacterBody2D

@export var speed = 300
@export var jump = -400
@export var dead = 1000

var gravity = 980
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var coin_script: Node = get_node("//Scene/coin_bronze_star.gd")

func _process(delta: float) -> void:
	pass
	muerte()

func muerte():
	if position.y > dead:
		get_tree().change_scene_to_file("res://Scenes/level_1.tscn")
		coin_script.reset_coins()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump

	# Devuelve la direccion del jugador --> -1,0,1
	var direction := Input.get_axis("move_left", "move_right")

	# Invertir Sprite
	if direction < 0:
		animated_sprite_2d.flip_h = true
	elif direction > 0:
		animated_sprite_2d.flip_h = false

	# Maneja Animaciones
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("Idle")
		else:
			animated_sprite_2d.play("Run")
	else:
		if velocity.y < 0:
			animated_sprite_2d.play("Jump")

	# Agrega movimiento
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
