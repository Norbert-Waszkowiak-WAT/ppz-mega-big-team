extends Button

@onready var label_brak_kasy = $Label2
@onready var global = get_node("/root/Global")  # Pobranie singletona Global

func _ready():
	label_brak_kasy.hide()  # Ukryj label na start
	connect("pressed", _on_pressed)  # Poprawna składnia połączenia sygnału

func _on_pressed():
	if global.coin < 10:
		label_brak_kasy.show()
		await get_tree().create_timer(1.76).timeout
		label_brak_kasy.hide()
	else:
		global.coin -= 10
		get_tree().change_scene_to_file("res://scenes/poker_game.tscn")  # Sprawdź poprawność ścieżki
