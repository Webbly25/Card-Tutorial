class_name Card
extends Node2D

signal mouse_entered(card: Card)
signal mouse_exited(card: Card)

@onready var baseCard: BaseCard = $BaseCard

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	baseCard.mouse_entered.connect(_on_card_mouse_entered)
	baseCard.mouse_exited.connect(_on_card_mouse_exited)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func activate() -> void:
	pass # implement per card

func highlight() -> void:
	baseCard.highlight()

func unhighlight() -> void:
	baseCard.unhighlight()

func _on_card_mouse_entered():
	mouse_entered.emit(self)

func _on_card_mouse_exited():
	mouse_exited.emit(self)
