extends Area2D

var level: int = 1

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('Ale'):
		
		level = level + 2
		print("El nivel al que irás será: " + str(level))
		
		var scene_path: String = "res://Scenes/level_" + str(level) + ".tscn"
		
		if ResourceLoader.exists(scene_path):
			get_tree().change_scene_to_file(scene_path)  # Cambiar a la nueva escena
			level += 1  # Aumentar el nivel solo después de cambiar la escena
		else:
			print("La escena no existe: ", scene_path, " pasarás a la pantalla de inicio")
			get_tree().change_scene_to_file("res://Scenes/inicio.tscn")
