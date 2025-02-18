extends Button  # Jeśli to faktycznie przycisk, zmień `Control` na `Button`

func _on_pressed():
	Global.add_coin(1)  # Dodajemy 1 do wartości coin
