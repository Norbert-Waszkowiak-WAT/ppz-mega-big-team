extends Button

@onready var label8 = $"../karta_przecziwnika1/Label"
@onready var label9 = $"../karta_przecziwnika2/Label"
var hand_value = 0
var enemy_value = 0

func _ready():
	hand_value = 0
	enemy_value = 0


func _on_pressed():
	# Called when the node enters the scene tree for the first time.
	give_card(Global.enemy_cards)
	var ranking = get_hand_ranking(Global.player_cards, Global.table_cards)
	var ranking_przeciwnika = get_enemy_ranking(Global.enemy_cards, Global.table_cards)
	
	print("Układ kart: ", ranking)
	print("układ kart przeciwnika: ", ranking_przeciwnika)
	print("wynik: ", who_won(hand_value, enemy_value))
func get_hand_ranking(player_cards: Array, table_cards: Array) -> String:
	var all_cards = player_cards + table_cards  # 7 kart razem
	
	var value_count = {}
	var suit_count = {}

	for card in all_cards:
		value_count[card.rank] = value_count.get(card.rank, 0) + 1
		suit_count[card.suit] = suit_count.get(card.suit, 0) + 1

	var flush_suit = get_flush_suit(suit_count)
	if flush_suit != "":
		var flush_cards = get_flush_cards(all_cards, flush_suit)
		if is_straight(flush_cards):
			if 14 in flush_cards:
				hand_value = 9
				return "Royal Flush"
			hand_value = 8
			return "Straight Flush"

	for rank in value_count.keys():
		if value_count[rank] == 4:
			hand_value = 7
			return "Four of a Kind"

	var three = null
	var pair = null
	for rank in value_count.keys():
		if value_count[rank] == 3:
			three = rank
		elif value_count[rank] == 2:
			pair = rank
	if three != null and pair != null:
		hand_value = 6
		return "Full House"
	
	if flush_suit != "":
		hand_value = 5
		return "Flush"

	var sorted_values = value_count.keys()
	sorted_values.sort()
	if is_straight(sorted_values):
		hand_value = 4
		return "Straight"

	if three != null:
		hand_value = 3
		return "Three of a Kind"

	var pairs = []
	for rank in value_count.keys():
		if value_count[rank] == 2:
			pairs.append(rank)
	if pairs.size() >= 2:
		hand_value = 2
		return "Two Pair"

	if pairs.size() == 1:
		hand_value = 1
		return "One Pair"
	hand_value = 0
	return "High Card"

func get_flush_suit(suit_count: Dictionary) -> String:
	for suit in suit_count.keys():
		if suit_count[suit] >= 5:
			return suit
	return ""

func get_flush_cards(cards: Array, flush_suit: String) -> Array:
	var suited_cards = []
	for card in cards:
		if card.suit == flush_suit:
			suited_cards.append(card.rank)
	suited_cards.sort()
	return suited_cards

func is_straight(values: Array) -> bool:
	if values.size() < 5:
		return false
	
	var streak = 1
	for i in range(1, values.size()):
		if values[i] == values[i - 1] + 1:
			streak += 1
			if streak == 5:
				return true
		elif values[i] != values[i - 1]:
			streak = 1

	if 14 in values and [2, 3, 4, 5].all(func(v): return v in values):
		return true

	return false

func get_enemy_ranking(enemy_cards: Array, table_cards: Array) -> String:
	
	var all_cards = enemy_cards + table_cards  # 7 kart razem
	
	var value_count = {}
	var suit_count = {}

	for card in all_cards:
		value_count[card.rank] = value_count.get(card.rank, 0) + 1
		suit_count[card.suit] = suit_count.get(card.suit, 0) + 1

	var flush_suit = get_flush_suit(suit_count)
	if flush_suit != "":
		var flush_cards = get_flush_cards(all_cards, flush_suit)
		if is_straight(flush_cards):
			if 14 in flush_cards:
				enemy_value = 9
				return "Royal Flush"
			enemy_value = 8
			return "Straight Flush"

	for rank in value_count.keys():
		if value_count[rank] == 4:
			enemy_value = 7
			return "Four of a Kind"

	var three = null
	var pair = null
	for rank in value_count.keys():
		if value_count[rank] == 3:
			three = rank
		elif value_count[rank] == 2:
			pair = rank
	if three != null and pair != null:
		enemy_value = 6
		return "Full House"
	
	if flush_suit != "":
		enemy_value = 5
		return "Flush"

	var sorted_values = value_count.keys()
	sorted_values.sort()
	if is_straight(sorted_values):
		enemy_value = 4
		return "Straight"

	if three != null:
		enemy_value = 3
		return "Three of a Kind"

	var pairs = []
	for rank in value_count.keys():
		if value_count[rank] == 2:
			pairs.append(rank)
	if pairs.size() >= 2:
		enemy_value = 2
		return "Two Pair"

	if pairs.size() == 1:
		enemy_value = 1
		return "One Pair"
	enemy_value = 0
	return "High Card"

func give_card(enemy_cards: Array):
	label8.text = str(enemy_cards[0].rank, " ", enemy_cards[0].suit)
	label9.text = str(enemy_cards[1].rank, " ", enemy_cards[1].suit)

func who_won(hand_value: int, enemy_value: int):
	if hand_value > enemy_value:
		return "you won"
	if hand_value < enemy_value:
		return "enemy won"
	if hand_value == enemy_value:
		return "draw"
