extends Control

var random_int

func _ready():
	var B1 = $VBoxContainer/margin1/label
	var B2 = $VBoxContainer/margin2/label
	var B3 = $VBoxContainer/margin3/label
	var B4 = $VBoxContainer/margin4/label
	var B5 = $VBoxContainer/margin5/label
	var table = []
	for i in range(61, 80):  # Liczby od 1 do 99
		table.append(i)
	print(table)
	
	random_int = randi() % table.size()
	B1.text = str(table[random_int])
	table.erase(table[random_int])
	
	random_int = randi() % table.size()
	B2.text = str(table[random_int])
	table.erase(table[random_int])
	
	random_int = randi() % table.size()
	B3.text = str(table[random_int])
	table.erase(table[random_int])
	
	random_int = randi() % table.size()
	B4.text = str(table[random_int])
	table.erase(table[random_int])
	
	random_int = randi() % table.size()
	B5.text = str(table[random_int])
	table.erase(table[random_int])
