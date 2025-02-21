extends Node

class Card:
	var rank: int  # Wartość karty (2-14, gdzie 14 to As)
	var suit: String  # "hearts", "diamonds", "clubs", "spades"
	
	func _init(r: int, s: String):
		rank = r
		suit = s

var deck: Array = []  # Talia kart
var player_cards: Array = []  # Karty gracza
var enemy_cards: Array = []  # Karty gracza
var table_cards: Array = []  # Karty na stole

func create_deck():
	deck.clear()
	for suit in ["hearts", "diamonds", "clubs", "spades"]:
		for rank in range(2, 15):  # 2 - As (14)
			deck.append(Card.new(rank, suit))
	deck.shuffle()  # Tasujemy karty

var coin: int = 0  # Globalna zmienna coin
var chip: int = 0
var drawn = []  # Globalna tablica wylosowanych kart
signal my_signal(coin)  # Sygnał wysyłający wartość coin
signal chip_signal(chip)

func add_coin(value: int):
	coin += value
	emit_signal("my_signal", coin)  # Wysyłamy nową wartość
	print("Nowa wartość coin:", coin)
	
func add_chip(value: int):
	chip = value
	emit_signal("chip_signal", chip)  # Wysyłamy nową wartość

func change_chip(value: int):
	chip = chip + value
	emit_signal("chip_signal", chip)
