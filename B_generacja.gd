extends Control

func _ready():
	var B1 = $VBoxContainer/margin1/label
	var B2 = $VBoxContainer/margin2/label
	var B3 = $VBoxContainer/margin3/label
	var B4 = $VBoxContainer/margin4/label
	var B5 = $VBoxContainer/margin5/label
	var table = []
	for i in range(1, 20):  # Liczby od 1 do 99
		table.append(i)
	print(table)

	
