extends Label

# Deklaracja tabeli liczb od 1 do 99
var table = []
var random_int
var j = 99

func _ready():
	self.text= " "
	# Wypełnienie tabeli liczbami od 1 do 99
	for i in range(1, 100):  # Liczby od 1 do 99
		table.append(i)
	print(table)

	while j > 0:
		await get_tree().create_timer(4.0).timeout
		losuj()
		j -= 1  # Zmniejszenie licznika, aby pętla mogła się zakończyć

	print(table)

func losuj():
	# Losowanie indeksu w zakresie od 0 do rozmiaru tabeli - 1
	random_int = randi() % table.size()
	print("Wylosowany indeks:", random_int, "Wartość:", table[random_int])
	self.text = str(table[random_int])
	table.erase(table[random_int])  # Usunięcie liczby z tabeli na podstawie jej wartości


	


	
