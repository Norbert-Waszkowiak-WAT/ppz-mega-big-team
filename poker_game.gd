extends Control

@onready var label1 = $katrta_gracza1/Label
@onready var label2 = $katrta_gracza2/Label
@onready var label3 = $katrta1/Label
@onready var label4 = $katrta2/Label
@onready var label5 = $katrta3/Label
@onready var label6 = $katrta4/Label
@onready var label7 = $katrta5/Label

@onready var label8 = $karta_przecziwnika1/Label
@onready var label9 = $karta_przecziwnika2/Label

func _ready():
	Global.create_deck()  # Tworzymy i tasujemy talię
	deal_cards()  # Rozdajemy karty graczowi i na stół
	give_card(Global.player_cards, Global.table_cards,Global.enemy_cards)  # Sprawdzamy układ

func deal_cards():
	# Rozdajemy 2 karty graczowi
	Global.player_cards = [Global.deck.pop_front(), Global.deck.pop_front()]
	Global.enemy_cards = [Global.deck.pop_front(), Global.deck.pop_front()]
	Global.table_cards.clear()
	for i in range(5):
		Global.table_cards.append(Global.deck.pop_front())

func give_card(player_cards: Array, table_cards: Array, enemy_cards: Array):

	# Aktualizowanie etykiet GUI, wyświetlając rank i kolor kart
	label1.text = str(player_cards[0].rank, " ", player_cards[0].suit)
	label2.text = str(player_cards[1].rank, " ", player_cards[1].suit)
	label3.text = str(table_cards[0].rank, " ", table_cards[0].suit)
	label4.text = str(table_cards[1].rank, " ", table_cards[1].suit)
	label5.text = str(table_cards[2].rank, " ", table_cards[2].suit)
	label6.text = str(table_cards[3].rank, " ", table_cards[3].suit)
	label7.text = str(table_cards[4].rank, " ", table_cards[4].suit)
	label8.text = "hidden"
	label9.text = "hidden"
