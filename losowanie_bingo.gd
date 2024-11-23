extends Label

func _ready():
	self.text = " "
	await get_tree().create_timer(2).timeout
	randomize()
	var random_number = randi_range(1, 99)
	print("Wylosowana liczba:", random_number)
	self.text = str(random_number)
