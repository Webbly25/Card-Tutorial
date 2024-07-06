@tool

class_name Hand
extends Node2D

signal card_activated(card: Card)

var hand_radius: int = 1000
var angle_limit: float = 20
var maxmimum_spread_angle: float = 2.5

@onready var test_card = $TestCard
@onready var collision_shape: CollisionShape2D = $DebugShape

var hand: Array = []
var touched_idxs: Array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	(collision_shape.shape as CircleShape2D).radius = hand_radius

func _input(event):
	if (event.is_action_pressed("mouse_click")):
		if (touched_idxs.size() > 0):
			var card_idx = calc_highlight_idx()
			var card = hand[card_idx]
			card_activated.emit(card)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	if (touched_idxs.size() > 0):
		hand[calc_highlight_idx()].highlight()

func reset() -> void:
	for card in hand:
		card.queue_free()
	hand.clear()
	touched_idxs.clear()

func add_card(card: Card) -> void:
	hand.push_back(card)
	add_child(card)
	card.mouse_entered.connect(_handle_card_touched)
	card.mouse_exited.connect(_handle_card_untouched)
	reposition_cards()

func remove_card(card: Card) -> void:
	var card_idx = hand.find(card)

	hand.remove_at(card_idx)
	touched_idxs.erase(card_idx)

	remove_child(card)
	reposition_cards()
	card.queue_free()

func reposition_cards() -> void:
	var card_spread = min(angle_limit / hand.size(), maxmimum_spread_angle)
	var current_angle = -(card_spread * (hand.size() - 1)) / 2 - 90

	for card in hand:
		card.position = get_card_position(current_angle)
		card.rotation_degrees = current_angle + 90
		current_angle += card_spread

func get_card_position(angle_deg: float) -> Vector2:
	var x: float = hand_radius * cos(deg_to_rad(angle_deg))
	var y: float = hand_radius * sin(deg_to_rad(angle_deg))
	return Vector2(x, y)

func _handle_card_touched(card: Card) -> void:
	var card_idx = hand.find(card)

	# unhighlight all cards
	for idx in touched_idxs:
		hand[idx].unhighlight()

	# add the card to the touched_idxs array
	touched_idxs.push_back(card_idx)

func _handle_card_untouched(card: Card) -> void:
	var card_idx = hand.find(card)
	hand[card_idx].unhighlight()
	
	# remove the card from the touched_idxs array
	touched_idxs.erase(card_idx)

func calc_highlight_idx() -> int:
	var max_idx = -1
	for idx in touched_idxs:
		if (idx > max_idx):
			max_idx = idx
	return max_idx
