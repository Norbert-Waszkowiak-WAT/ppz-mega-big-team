extends LineEdit

func _ready():
	placeholder_text = "Wpisz liczbę żetonów i naciśnij Enter..."  
	connect("text_submitted", Callable(self, "_on_text_submitted"))  # Po Enter wykonuje akcję



func _on_text_changed(new_text):
	var filtered_text = ""
	
	for char in new_text:
		if char.is_valid_int():  # Sprawdza, czy znak jest cyfrą
			filtered_text += char  # Dodaje tylko cyfry
	
	if text != filtered_text:
		text = filtered_text  # Aktualizuje pole tekstowe bez liter


func _on_text_submitted(new_text):
	if new_text.is_valid_int():  # ✅ Użycie poprawnej funkcji w Godot 4
		var requested_tokens = int(new_text)
		print("Gracz chce kupić %d żetonów" % requested_tokens)
	else:
		print("Niepoprawna liczba!")
