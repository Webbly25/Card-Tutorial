extends Node2D

@onready var AttackCardScene: PackedScene = preload ("res://scenes/cards/attack_card.tscn")
@onready var DefendCardScene: PackedScene = preload ("res://scenes/cards/defend_card.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_button_pressed():
	var attack_card = AttackCardScene.instantiate()
	attack_card.position = $CanvasLayer/SpawnPoint.position
	$CanvasLayer.add_child(attack_card)

func _on_button_2_pressed():
	var defend_card = DefendCardScene.instantiate()
	defend_card.position = $CanvasLayer/SpawnPoint.position
	$CanvasLayer.add_child(defend_card)
