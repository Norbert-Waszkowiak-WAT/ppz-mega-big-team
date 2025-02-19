extends Button

var global

var label_node2


func _ready():
	# Znajdź node tekstu (Label)
	label_node2 = get_node("/root/Casino/Button/cost")
	connect("pressed", _on_pressed)
	global = get_node("/root/Global")  # Jeśli używasz singletona do przechowywania zmiennej `coin`
	
func _on_pressed():
	if global.coin < 10:
		label_node2.text = "Nie masz wystarczająco pieniędzy"
		await get_tree().create_timer(3).timeout
		label_node2.text = "*Cost: 10 coins*"
	else:
		global.coin -= 10
		get_tree().change_scene_to_file("res://scenes/poker_game.tscn")  # Upewnij się, że ścieżka jest poprawna
