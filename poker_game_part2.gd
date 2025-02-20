extends Control

func _ready():
	Global.create_deck()  # Tworzymy talię
	deal_cards()  # Rozdajemy karty graczowi i na stół
	var ranking = get_hand_ranking(Global.player_cards, Global.table_cards)
	print("Układ kart: ", ranking)

func deal_cards():
	# Rozdajemy 2 karty graczowi
	Global.player_cards = [Global.deck.pop_front(), Global.deck.pop_front()]
	
	# Rozdajemy 5 kart na stół
	Global.table_cards = []
	for i in range(5):
		Global.table_cards.append(Global.deck.pop_front())

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
				return "Royal Flush"
			return "Straight Flush"

	for rank in value_count.keys():
		if value_count[rank] == 4:
			return "Four of a Kind"

	var three = null
	var pair = null
	for rank in value_count.keys():
		if value_count[rank] == 3:
			three = rank
		elif value_count[rank] == 2:
			pair = rank
	if three != null and pair != null:
		return "Full House"
	
	if flush_suit != "":
		return "Flush"

	var sorted_values = value_count.keys()
	sorted_values.sort()
	if is_straight(sorted_values):
		return "Straight"

	if three != null:
		return "Three of a Kind"

	var pairs = []
	for rank in value_count.keys():
		if value_count[rank] == 2:
			pairs.append(rank)
	if pairs.size() >= 2:
		return "Two Pair"

	if pairs.size() == 1:
		return "One Pair"

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
