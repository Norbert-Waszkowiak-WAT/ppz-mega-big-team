extends Control

func _ready():
	# Znajdź węzeł Label w drzewie przez MarginContainer
	var label = $MarginContainer/Label
	# Ustaw tekst etykiety na "skibidi"
	label.text = "skibidi"


# Called every frame. 'delta' is the elapsed time since the previous frame.
