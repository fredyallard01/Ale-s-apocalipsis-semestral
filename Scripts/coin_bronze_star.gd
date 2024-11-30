extends AnimatedSprite2D

var coincount : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func reset_coin(delta: float) -> void:
	coincount = 0

func _on_interact_body_exited(body: Node2D) -> void:
	if body.is_in_group("Ale"):
		coincount = 0


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group('Ale'):
		coincount += 1
		GameManager.coins += coincount
		GameManager.score += 50
		queue_free()
