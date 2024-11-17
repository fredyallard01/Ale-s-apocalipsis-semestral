extends RigidBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group('Ale'):
		get_tree().change_scene_to_file("res://Scenes/inicio.tscn")
