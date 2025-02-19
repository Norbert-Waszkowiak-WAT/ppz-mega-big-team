extends TextureButton

# Zmienna do przechowywania referencji do tekstu
var label_node

func _ready():
	# Znajdź node tekstu (Label)
	label_node = get_node("/root/scena_3/TextureButton2/Label2")
	# Ukryj tekst na początku
	label_node.hide()
	
	connect("mouse_entered", _on_Button_mouse_entered)
	connect("mouse_exited", _on_Button_mouse_exited)
	connect("pressed", _on_pressed)

func _on_Button_mouse_entered():
	label_node.show()

func _on_Button_mouse_exited():
	# Ukryj tekst, gdy kursor opuszcza przycisk
	label_node.hide()

func _on_pressed():
	# Zmień scenę po naciśnięciu przycisku
	get_tree().change_scene_to_file("res://casino.tscn")
