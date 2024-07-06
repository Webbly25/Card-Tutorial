class_name GameController

extends Node2D

enum GameState {
	PLAYER_TURN,
	ENEMY_TURN,
	GAME_OVER,
	GAME_WIN
}

var current_state: GameState = GameState.PLAYER_TURN

func transition(new_state: GameState) -> void:
	if (current_state == new_state):
		return

	# leaving current state
	match current_state:
		GameState.PLAYER_TURN:
			print("end player's turn")
		GameState.ENEMY_TURN:
			print("end enemy's turn")
		GameState.GAME_OVER:
			print("end game over")
		GameState.GAME_WIN:
			print("end game win")

	current_state = new_state

	# entering new state
	match current_state:
		GameState.PLAYER_TURN:
			$"../GameScreen/Player".start_turn()
			print("start player's turn")
		GameState.ENEMY_TURN:
			$"../GameScreen/Enemy".start_turn()
			print("start enemy's turn")
		GameState.GAME_OVER:
			print("start game over")
		GameState.GAME_WIN:
			print("start game win")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
