extends Control
## Results scene - shows end-of-level score, stars, and navigation

@onready var score_label: Label = $VBox/ScoreLabel
@onready var accuracy_label: Label = $VBox/AccuracyLabel
@onready var stars_label: Label = $VBox/StarsLabel
@onready var message_label: Label = $VBox/MessageLabel
@onready var replay_button: Button = $VBox/ButtonContainer/ReplayButton
@onready var next_button: Button = $VBox/ButtonContainer/NextButton
@onready var menu_button: Button = $VBox/ButtonContainer/MenuButton


func _ready() -> void:
	replay_button.pressed.connect(_on_replay_pressed)
	next_button.pressed.connect(_on_next_pressed)
	menu_button.pressed.connect(_on_menu_pressed)

	_display_results()


func _display_results() -> void:
	var score = GameManager.last_level_score
	var catches = GameManager.last_level_catches
	var misses = GameManager.last_level_misses
	var stars = GameManager.last_level_stars
	var level = GameManager.current_level

	var total = catches + misses
	var accuracy = 0
	if total > 0:
		accuracy = int((float(catches) / total) * 100)

	score_label.text = "Score: %d" % score
	accuracy_label.text = "Catches: %d / %d (%d%%)" % [catches, total, accuracy]

	# Display stars as treats (using BBCode for colors)
	var star_text = "[center]"
	for i in range(3):
		if i < stars:
			star_text += "[color=gold][font_size=64]★[/font_size][/color] "
		else:
			star_text += "[color=gray][font_size=64]☆[/font_size][/color] "
	star_text += "[/center]"
	stars_label.text = star_text

	# Encouraging message based on performance
	message_label.text = _get_message(stars, accuracy)

	# Hide "Next" if on last level
	next_button.visible = level < GameManager.TOTAL_LEVELS


func _get_message(stars: int, accuracy: int) -> String:
	if stars == 3:
		return "Amazing! All the pups are so happy!"
	elif stars == 2:
		return "Great job! The pups loved it!"
	elif stars == 1:
		return "Good work! The pups are grateful!"
	elif accuracy >= 30:
		return "The pups are still hungry! Try again?"
	else:
		return "Keep practicing! The pups believe in you!"


func _on_replay_pressed() -> void:
	GameManager.replay_level()


func _on_next_pressed() -> void:
	GameManager.next_level()


func _on_menu_pressed() -> void:
	GameManager.go_to_main_menu()
