extends ProgressBar

var maxValor: int
 
func _ready():
	maxValor = 100
	value = maxValor

func disminuirVida(damage):
	value -=damage
	
	if value <= 0:
		get_tree().get_nodes_in_group("player")[0].death()
