extends LineEdit



func _ready():
	self.text = "Wpisz coś..."
	self.placeholder_text = "Tu wpisz swój tekst"

func _on_Button_pressed():
	self.text=" "

func _on_LineEdit_text_submitted(new_text):
	print("Użytkownik wpisał: ", new_text)
