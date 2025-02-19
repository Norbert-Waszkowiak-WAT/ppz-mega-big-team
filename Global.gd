extends Node

var coin: int = 0  # Globalna zmienna coin
var chip: int = 0
signal my_signal(coin)  # Sygnał wysyłający wartość coin
signal chip_signal(chip)

func add_coin(value: int):
	coin += value
	emit_signal("my_signal", coin)  # Wysyłamy nową wartość
	print("Nowa wartość coin:", coin)
	
func add_chip(value: int):
	chip = value
	emit_signal("chip_signal", chip)  # Wysyłamy nową wartość
