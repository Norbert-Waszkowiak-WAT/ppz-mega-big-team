extends Node

var coin: int = 0  # Globalna zmienna coin

signal my_signal(coin)  # Sygnał wysyłający wartość coin

func add_coin(value: int):
	coin += value
	emit_signal("my_signal", coin)  # Wysyłamy nową wartość
	print("Nowa wartość coin:", coin)
