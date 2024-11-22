extends ProgressBar

var hpmax: int
var hpmin:int


func _ready() -> void:
	hpmax =50

func vida(damage):
	value -=damage
