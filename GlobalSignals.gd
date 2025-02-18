extends Node

signal my_signal(data)  # Tworzymy sygnał

func send_signal(data):
	emit_signal("my_signal", data)  # Wysyłamy sygnał
