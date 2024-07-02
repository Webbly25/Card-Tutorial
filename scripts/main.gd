extends Node2D

@onready var AttackCardScene: PackedScene = preload ("res://scenes/cards/attack_card.tscn")
@onready var DefendCardScene: PackedScene = preload ("res://scenes/cards/defend_card.tscn")

@onready var hand: Hand = $CanvasLayer/Hand

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	pass

func _on_button_pressed() -> void:
	var attack_card = AttackCardScene.instantiate()
	hand.add_card(attack_card)

func _on_button_2_pressed() -> void:
	var defend_card = DefendCardScene.instantiate()
	hand.add_card(defend_card)
