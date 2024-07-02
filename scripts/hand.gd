@tool

class_name Hand
extends Node2D

var hand_radius: int = 1000
var angle_limit: float = 20
var maxmimum_spread_angle: float = 2.5

@onready var test_card = $TestCard
@onready var collision_shape: CollisionShape2D = $DebugShape

var hand: Array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:

	# tool logic
	if (collision_shape.shape as CircleShape2D).radius != hand_radius:
		(collision_shape.shape as CircleShape2D).radius = hand_radius

func add_card(card: Node2D) -> void:
	hand.push_back(card)
	add_child(card)
	reposition_cards()

func remove_card(card_idx: int) -> Node2D:
	var card = hand.pop_at(card_idx)
	remove_child(card)
	reposition_cards()
	return card

func reposition_cards() -> void:
	var card_spread = min(angle_limit / hand.size(), maxmimum_spread_angle)
	var current_angle = -(card_spread * (hand.size() - 1)) / 2 - 90

	for card in hand:
		_update_card_transform(card, current_angle)
		current_angle += card_spread

func _update_card_transform(card: Node2D, angle_deg: float) -> void:
	card.position = get_card_position(angle_deg)
	card.rotation_degrees = angle_deg + 90

func get_card_position(angle_deg: float) -> Vector2:
	var x: float = hand_radius * cos(deg_to_rad(angle_deg))
	var y: float = hand_radius * sin(deg_to_rad(angle_deg))
	return Vector2(x, y)