@tool

class_name Character
extends Node2D

@export var max_health: int = 10
@export var current_health: int = 10
@export var max_mana: int = 10
@export var current_mana: int = max_mana
@export var texture: Texture2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.texture = texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func set_health(_health) -> void:
	current_health = clampi(_health, 0, max_health)
	$HealthBar.value = current_health

func take_damage(damage: int) -> void:
	set_health(current_health - damage)

func set_mana(_mana) -> void:
	current_mana = clampi(_mana, 0, max_mana)
	# $ManaBar.value = current_mana

func spend_mana(mana_cost: int) -> void:
	set_mana(current_mana - mana_cost)