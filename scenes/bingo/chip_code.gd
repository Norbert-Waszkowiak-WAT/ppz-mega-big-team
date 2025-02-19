extends Label

func _ready():
	Global.connect("chip_signal", _on_signal_received)  # Podłączamy się do sygnału
	self.text = str(Global.chip)  # Ustawiamy wartość na start

func _on_signal_received(new_chip_value):
	self.text = str(new_chip_value)  # Aktualizujemy tekst na nową wartość
	
