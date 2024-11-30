extends Node

var coins = 0 
var score = 0


func _process(delta: float) -> void:
	$"GUI/CoinsValue".text = str(coins)
	$"GUI/ScoreValue".text = str(score)
	
func reset_coins():
	coins = 0
	score = 0
