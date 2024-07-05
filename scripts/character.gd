@tool

class_name Character
extends Node2D

@export var max_health: int = 10
@export var current_health: int = 10
@export var texture: Texture2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.texture = texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func set_health(_health) -> void:
	current_health = _health if _health < max_health else max_health 
	$HealthBar.value = current_health
