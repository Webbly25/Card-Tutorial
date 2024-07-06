extends "res://scripts/cards/card.gd"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)

func activate(payload: ActionPayload) -> void:
	# spend 1 mana
	payload.caster.spend_mana(baseCard.card_mana_cost)
	# add 1 defence
	payload.caster.add_armour(1)
