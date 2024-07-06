extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_deck_card_activated(card: Card) -> void:
	var payload = ActionPayload.new($GameScreen/Player, [$GameScreen/Enemy])
	card.activate(payload)

func _on_damage_1_button_pressed():
	$GameScreen/Player.take_damage(1)

func _on_damage_3_button_pressed():
	$GameScreen/Player.take_damage(3)
