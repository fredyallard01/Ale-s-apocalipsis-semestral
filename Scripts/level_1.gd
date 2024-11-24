extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_transition_body_entered(body: Node2D) -> void:
	if body.is_in_group("Ale"):
		get_tree().change_scene_to_file("res://Scenes/level_test.tscn")


func _on_interact_body_exited(body: Node2D) -> void:
	if body.is_in_group("Ale"):
		body.die()
