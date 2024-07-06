extends Node2D

@onready var game_controller: GameController = $GameController

var enemy_ai_state: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:

	if ($GameScreen/Player.current_health <= 0):
		game_controller.transition(GameController.GameState.GAME_OVER)
	elif ($GameScreen/Enemy.current_health <= 0):
		game_controller.transition(GameController.GameState.GAME_WIN)
	
	match game_controller.current_state:
		GameController.GameState.PLAYER_TURN:
			pass
		GameController.GameState.ENEMY_TURN:
			# simulate enemy AI
			match enemy_ai_state:
				0:
					$GameScreen/Enemy.add_armour(0)
					$GameScreen/Player.take_damage(3)
				1:
					$GameScreen/Enemy.add_armour(1)
					$GameScreen/Player.take_damage(2)
				2:
					$GameScreen/Enemy.add_armour(2)
					$GameScreen/Player.take_damage(1)
			
			enemy_ai_state = posmod(enemy_ai_state + 1, 3)
			game_controller.transition(GameController.GameState.PLAYER_TURN)
		GameController.GameState.GAME_OVER:
			$Overlays/GameOverOverlay.visible = true
		GameController.GameState.GAME_WIN:
			$Overlays/GameWinOverlay.visible = true

func _input(event):
	if (event is InputEventKey):
		if (event.is_action_pressed("reset")):
			game_reset()

func game_reset() -> void:
	enemy_ai_state = 0
	$GameScreen/Player.reset()
	$GameScreen/Enemy.reset()
	$Deck.reset()
	$Overlays/GameOverOverlay.visible = false
	$Overlays/GameWinOverlay.visible = false
	game_controller.current_state = GameController.GameState.PLAYER_TURN

func _on_deck_card_activated(card: Card) -> void:
	if (card.cost > $GameScreen/Player.current_mana):
		return
	
	$GameScreen/Player.spend_mana(card.cost)

	var payload = ActionPayload.new($GameScreen/Player, [$GameScreen/Enemy])
	card.activate(payload)
	$Deck.remove_card(card)

func _on_end_turn_pressed():
	game_controller.transition(GameController.GameState.ENEMY_TURN)
