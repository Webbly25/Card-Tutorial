extends "res://scripts/cards/card.gd"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)

func activate(_payload: ActionPayload) -> void:
	# spend 1 mana
	# add 1 defence to the player
	print("defend")
