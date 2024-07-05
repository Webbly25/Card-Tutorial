@tool

class_name Card
extends Node2D

signal mouse_entered(card: Card)
signal mouse_exited(card: Card)

@export var card_name: String
@export var card_mana_cost: int
@export var card_description: String
@export var card_texture: Texture2D

@onready var name_lbl: Label = $Name/NameLabel
@onready var mana_lbl: Label = $Mana/ManaLabel
@onready var description_lbl: Label = $CardDescriptionLabel
@onready var card_sprite: Sprite2D = $CardSprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_update_graphics()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	_update_graphics()

func set_values(_name: String, _mana_cost: int, _description: String) -> void:
	card_name = _name
	card_mana_cost = _mana_cost
	card_description = _description

func _update_graphics() -> void:
	if (name_lbl.get_text() != card_name):
		name_lbl.set_text(card_name)

	if (mana_lbl.get_text() != str(card_mana_cost)):
		mana_lbl.set_text(str(card_mana_cost))

	if (description_lbl.get_text() != card_description):
		description_lbl.set_text(card_description)
	
	if (card_sprite.texture != card_texture):
		card_sprite.texture = card_texture

func highlight() -> void:
	$BaseCardSprite.modulate = Color(1, 0.5, 0.1, 1)

func unhighlight() -> void:
	$BaseCardSprite.modulate = Color(1, 1, 1, 1)

func _on_area_2d_mouse_entered() -> void:
	mouse_entered.emit(self)

func _on_area_2d_mouse_exited() -> void:
	mouse_exited.emit(self)
