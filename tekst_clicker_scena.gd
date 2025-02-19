extends Label

func _on_signal_received(tekst1):
	visible = visible
	
	

func _ready():
	visible = not visible
	GlobalSignals.connect("tekst1", _on_signal_received)  # Podłączamy się do sygnału
	
