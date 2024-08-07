@tool

class_name Character
extends Node2D

@export var max_health: int = 10
var current_health: int = 10

@export var show_mana: bool = true
@export var max_mana: int = 5
var current_mana: int = max_mana

var armour: int = 0

@export var texture: Texture2D

# TODO: max health and mana may change, so need initial max values

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.texture = texture
	
	$HealthBar.max_value = max_health
	set_health(current_health)

	if show_mana:
		$ManaBar.visible = true
		$ManaBar.max_value = max_mana
		set_mana(current_mana)
	else:
		$ManaBar.visible = false
	
	set_armour(armour)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func start_turn() -> void:
	set_mana(max_mana)
	set_armour(0)

func set_health(new_health) -> void:
	current_health = clampi(new_health, 0, max_health)
	$HealthBar.value = current_health

func reset() -> void:
	set_health(max_health)
	set_mana(max_mana)
	set_armour(0)

func take_damage(damage: int) -> void:
	if armour > damage:
		# more armour than damage so just reduce armour
		set_armour(armour - damage)
		damage = 0
		return
	
	# more damage than armour so set armour to 0 and reduce health
	damage -= armour
	set_armour(0)
	set_health(current_health - damage)

func set_mana(new_mana) -> void:
	current_mana = clampi(new_mana, 0, max_mana)
	if show_mana:
		$ManaBar.value = current_mana

func spend_mana(mana_cost: int) -> void:
	set_mana(current_mana - mana_cost)

func set_armour(new_armour) -> void:
	armour = max(new_armour, 0)

	if armour == 0:
		$ArmourSprite.visible = false
		return
	
	$ArmourSprite.visible = true
	$ArmourSprite/ArmourLabel.text = str(armour)

func add_armour(amount: int) -> void:
	set_armour(armour + amount)
