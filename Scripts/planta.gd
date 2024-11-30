extends CharacterBody2D

var velocidad: int = 115
var g: int = 150
var salto: int = -5000

func _ready():
	velocity.x = velocidad
	$AnimatedSprite2D.play("walk")

@warning_ignore("unused_parameter")
func _physics_process(delta):
	detectar()
	
	velocity.y = g
	
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	if is_on_wall():
		velocity.y = salto
		await (3)
		if !is_on_floor():
			velocity.y = g

	move_and_slide()

func detectar():
	if $izquierda.is_colliding():
		var izq = $izquierda.get_collider()

		if izq.is_in_group("player"):
			velocity.x = -velocidad * 2.5
			$AnimatedSprite2D.play("run")
			if is_on_wall():
				velocity.x = 0
		else:
			velocity.x = -velocidad
			$AnimatedSprite2D.play("walk")

	if $derecha.is_colliding():
		var der = $derecha.get_collider()
		if der.is_in_group("player"):
			velocity.x = velocidad * 2.5
			$AnimatedSprite2D.play("run")
			if is_on_wall():
				velocity.x = 0
		else:
			velocity.x = velocidad
			$AnimatedSprite2D.play("walk")




func _on_area_2d_body_entered(body: Node2D):
	if body.is_in_group("player"):
		$AnimatedSprite2D.play("attack1")
		#$AnimatedSprite2D.play("attack2")
	else:
		detectar()
		
		
