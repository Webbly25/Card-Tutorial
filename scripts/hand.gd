@tool

extends Node2D

@export var hand_radius: int = 1000
@export var card_angle: float = 0

@onready var test_card = $TestCard
@onready var collision_shape: CollisionShape2D = $DebugShape

func get_card_position(angle: float) -> Vector2:
	var x: float = hand_radius * cos(deg_to_rad(angle - 90))
	var y: float = hand_radius * sin(deg_to_rad(angle - 90))
	return Vector2(x, y)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:

	# tool logic
	if (collision_shape.shape as CircleShape2D).radius != hand_radius:
		(collision_shape.shape as CircleShape2D).radius = hand_radius
	
	test_card.position = get_card_position(card_angle)
	test_card.rotation_degrees = card_angle