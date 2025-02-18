extends Label

func _ready():
	Global.connect("my_signal", _on_signal_received)  # Podłączamy się do sygnału
	self.text = str(Global.coin)  # Ustawiamy wartość na start

func _on_signal_received(new_coin_value):
	self.text = str(new_coin_value)  # Aktualizujemy tekst na nową wartość
	print("Nowa wartość coin:", new_coin_value)
