extends CharacterBody2D

#manejo d evelocidades de la llama
var velocidad: int = 100
var incrementodevelocidad: int = 320
var decrementodevelocidad: int = 100
var perseguir: bool = false
var g: int = 150
var salto: int = -5000

#dirección de la llama
var buscar: int = 0

var caracterplanta: int = 1
#$AnimatedSprite2D.play("walk")

func _ready():
	velocity.x= -velocidad
	$AnimatedSprite2D.play("walk")

func animacion():
	#opcion 1: deberia caminar
	#opcion 2: deberia correr
	match caracterplanta:
		1:
			$AnimatedSprite2D.play("walk")
			velocidad = decrementodevelocidad
		2:
			$AnimatedSprite2D.play("run")
			velocidad = incrementodevelocidad
		_:
			print("La planta espera a Ale para cenarsela")

func buscador():
	match buscar:
		1:
			velocity.x = velocidad
		2:
			velocity.x = -velocidad
		_:
			print("La planta espera a Ale para cenarsela")

func deteccion():
	if $izquierda.is_colliding() or $derecha.is_colliding():
		print("la planta detecto algo")
		var colision = null
		if $izquierda.is_colliding():
			colision = $izquierda.get_collider()
			if colision.get_class() == "CharacterBody2D":
				buscar = 2
				caracterplanta = 2
				print("planta corre")
		if $derecha.is_colliding():
			colision = $derecha.get_collider()
			if colision.get_class() == "CharacterBody2D":
				buscar = 1
				caracterplanta = 2
				print("planta corre")
		if colision.get_class() == "TileMapLayer":
			buscar = 0
			caracterplanta = 1
			print("La planta encontro un muro")
					
	if !$izquierda.is_colliding() and !$derecha.is_colliding():
			print("la planta no detecta nada, así que caminará")
			buscar = 0
			caracterplanta = 1
			
#func deteccion():
	#if $izquierda.is_colliding() or $derecha.is_colliding():
		#var colision = null
		#if $izquierda.is_colliding():
			#colision = $izquierda.get_collider()  # Si hay colisión a la izquierda, obtén el objeto
		#elif $derecha.is_colliding():  # Si hay colisión a la derecha, obtén el objeto
			#colision = $derecha.get_collider()
		#if colision != null:
			#var tipo = colision.get_class()  # Obtiene el tipo de la clase del objeto
			#print("El objeto con el que colisiona es de tipo: " + tipo)

			
#func detectar():
	#if $izquierda.is_colliding():
		#var izq = $izquierda.get_collider()
		#if izq.is_in_group("player"):
			#perseguir = true
			#velocity.x = -velocidad * incrementodevelocidad
			#$AnimatedSprite2D.play("run")
		#elif !izq.is_in_group("player"):
			#velocity.x = -velocidad
			#$AnimatedSprite2D.play("walk")
			#perseguir = false
#
	#
	#if $derecha.is_colliding():
		#var der = $derecha.get_collider()
		#if der.is_in_group("player"):
			#perseguir = true
			#velocity.x = velocidad * incrementodevelocidad
			#$AnimatedSprite2D.play("run")
		#elif !der.is_in_group("player"):
			#velocity.x = velocidad
			#$AnimatedSprite2D.play("walk")
			#perseguir = false
			
func _on_area_2d_body_entered(body) :
	if body.is_in_group("player"):
		body.hit()



func movimientoenemigo():
	deteccion()
	animacion()
	buscador()

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
#
#@warning_ignore("unused_parameter")
#func _physics_process(delta):
	#detectar()
	#if !perseguir:
		#if is_on_wall():
			#if !$AnimatedSprite2D.flip_h:
				#velocity.x = -velocidad
			#else:
				#velocity.x = velocidad
	#if velocity.x < 0:
		#$AnimatedSprite2D.flip_h = true
	#elif velocity.x > 0:
		#$AnimatedSprite2D.flip_h = false
	#move_and_slide()
	
@warning_ignore("unused_parameter")
func _physics_process(delta):
	#detectar()
	velocity.y = g
	movimientoenemigo()
	if is_on_wall():
		if !$AnimatedSprite2D.flip_h:
			velocity.x = -velocidad
			velocity.y = salto
		else:
			velocity.x = velocidad
			velocity.y = salto
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
		

	move_and_slide()
	
