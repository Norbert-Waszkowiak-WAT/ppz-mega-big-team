extends Control

var available_numbers = []
@onready var label1 = $katrta_gracza1/Label
@onready var label2 = $katrta_gracza2/Label
@onready var label3 = $katrta1/Label
@onready var label4 = $katrta2/Label
@onready var label5 = $katrta3/Label
@onready var label6 = $katrta4/Label
@onready var label7 = $katrta5/Label

func _ready():
	# Inicjalizacja listy liczb od 1 do 52
	for i in range(1, 53):
		available_numbers.append(i)
	
	# Losowanie 5 liczb bez powtórzeń
	var drawn_numbers = draw_numbers(7)
	
	print("Wylosowane liczby: ", drawn_numbers)
	
	label1.text = str(drawn_numbers[0])
	label2.text = str(drawn_numbers[1])
	label3.text = str(drawn_numbers[2])
	label4.text = str(drawn_numbers[3])
	label5.text = str(drawn_numbers[4])
	label6.text = str(drawn_numbers[5])
	label7.text = str(drawn_numbers[6])

func draw_numbers(count):
	var drawn = []
	for i in range(count):
		if available_numbers.size() == 0:
			print("Brak dostępnych liczb.")
			break
		var index = randi() % available_numbers.size()
		var number = available_numbers[index]
		available_numbers.remove_at(index)  # Usunięcie wylosowanej liczby
		drawn.append(number)
	return drawn
