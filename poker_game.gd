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

@onready var k1 = $katrta_gracza1
@onready var k2 = $katrta_gracza2
@onready var k3 = $katrta1
@onready var k4 = $katrta2
@onready var k5 = $katrta3
@onready var k6 = $katrta4
@onready var k7 = $katrta5

@onready var k8 = $karta_przecziwnika1
@onready var k9 = $karta_przecziwnika2

func _ready():
	Global.create_deck()  # Tworzymy i tasujemy talię
	deal_cards()  # Rozdajemy karty graczowi i na stół
	give_card(Global.player_cards, Global.table_cards,Global.enemy_cards)  # Sprawdzamy układ
	k1.show()
	k2.show()
	k3.hide()
	k4.hide()
	k5.hide()
	k6.hide()
	k7.hide()
	k8.show()
	k9.show()

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
	label3.text = "hidden"
	label4.text = "hidden"
	label5.text = "hidden"
	label6.text = "hidden"
	label7.text = "hidden"
	label8.text = "hidden"
	label9.text = "hidden"
