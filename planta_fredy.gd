extends CharacterBody2D

var velocidad: int = 100
var incrementodevelocidad: int = 500
var decrementodevelocidad: int = 0
var perseguir: bool = false
#$AnimatedSprite2D.play("walk")

func _ready():
	velocity.x= -velocidad
	$AnimatedSprite2D.play("walk")

@warning_ignore("unused_parameter")
func _physics_process(delta):
	detectar()
	if !perseguir:
		if is_on_wall():
			if !$AnimatedSprite2D.flip_h:
				velocity.x = -velocidad
			else:
				velocity.x = velocidad
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	move_and_slide()

func detectar():
	if $izquierda.is_colliding():
		var izq = $izquierda.get_collider()
		if izq.is_in_group("player"):
			perseguir = true
			velocity.x = -velocidad * incrementodevelocidad
			$AnimatedSprite2D.play("run")
		elif !izq.is_in_group("player"):
			velocity.x = -velocidad
			$AnimatedSprite2D.play("walk")
			perseguir = false

	
	if $derecha.is_colliding():
		var der = $derecha.get_collider()
		if der.is_in_group("player"):
			perseguir = true
			velocity.x = velocidad * incrementodevelocidad
			$AnimatedSprite2D.play("run")
		elif !der.is_in_group("player"):
			velocity.x = velocidad
			$AnimatedSprite2D.play("walk")
			perseguir = false
