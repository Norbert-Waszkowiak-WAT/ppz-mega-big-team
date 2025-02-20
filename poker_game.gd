extends Control

@onready var label1 = $katrta_gracza1/Label
@onready var label2 = $katrta_gracza2/Label
@onready var label3 = $katrta1/Label
@onready var label4 = $katrta2/Label
@onready var label5 = $katrta3/Label
@onready var label6 = $katrta4/Label
@onready var label7 = $katrta5/Label

func _ready():
	Global.create_deck()  # Tworzymy i tasujemy talię
	deal_cards()  # Rozdajemy karty graczowi i na stół
	get_hand_ranking(Global.player_cards, Global.table_cards)  # Sprawdzamy układ

func deal_cards():
	# Rozdajemy 2 karty graczowi
	Global.player_cards = [Global.deck.pop_front(), Global.deck.pop_front()]
	
	# Rozdajemy 5 kart na stół
	Global.table_cards.clear()
	for i in range(5):
		Global.table_cards.append(Global.deck.pop_front())

func get_hand_ranking(player_cards: Array, table_cards: Array):
	var all_cards = player_cards + table_cards  # 7 kart razem

	# Aktualizowanie etykiet GUI, wyświetlając rank i kolor kart
	label1.text = str(player_cards[0].rank, " ", player_cards[0].suit)
	label2.text = str(player_cards[1].rank, " ", player_cards[1].suit)
	label3.text = str(table_cards[0].rank, " ", table_cards[0].suit)
	label4.text = str(table_cards[1].rank, " ", table_cards[1].suit)
	label5.text = str(table_cards[2].rank, " ", table_cards[2].suit)
	label6.text = str(table_cards[3].rank, " ", table_cards[3].suit)
	label7.text = str(table_cards[4].rank, " ", table_cards[4].suit)
