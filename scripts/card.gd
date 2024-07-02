@tool

class_name Card
extends Node2D

@export var card_name: String
@export var card_mana_cost: int
@export var card_description: String

@onready var name_lbl: Label = $Name/NameLabel
@onready var mana_lbl: Label = $Mana/ManaLabel
@onready var description_lbl: Label = $CardDescriptionLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	_update_graphics()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	_update_graphics()

func set_values(_name: String, _mana_cost: int, _description: String):
	card_name = _name
	card_mana_cost = _mana_cost
	card_description = _description

func _update_graphics():
	if (name_lbl.get_text() != card_name):
		name_lbl.set_text(card_name)

	if (mana_lbl.get_text() != str(card_mana_cost)):
		mana_lbl.set_text(str(card_mana_cost))

	if (description_lbl.get_text() != card_description):
		description_lbl.set_text(card_description)