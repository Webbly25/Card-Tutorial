extends Node2D

signal mouse_entered(card: Card)
signal mouse_exited(card: Card)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func highlight() -> void:
	$Card.highlight()

func unhighlight() -> void:
	$Card.unhighlight()

func _on_card_mouse_entered(_card: Card):
	mouse_entered.emit(self)

func _on_card_mouse_exited(_card: Card):
	mouse_exited.emit(self)
