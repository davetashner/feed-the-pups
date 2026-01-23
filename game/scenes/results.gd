extends Control
## Results scene - shows end-of-level score, stars, and navigation

@onready var score_label: Label = $VBox/ScoreLabel
@onready var accuracy_label: Label = $VBox/AccuracyLabel
@onready var stars_label: RichTextLabel = $VBox/StarsLabel
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
	# Encouraging messages for all outcomes - no negative feedback!
	if stars == 3:
		var messages_3 = [
			"Amazing! All the pups are so happy!",
			"Perfect! You're a treat-throwing champion!",
			"Wow! The pups want more!"
		]
		return messages_3[randi() % messages_3.size()]
	elif stars == 2:
		var messages_2 = [
			"Great job! The pups loved it!",
			"Yummy! The dogs are wagging their tails!",
			"So close to perfect! Great throwing!"
		]
		return messages_2[randi() % messages_2.size()]
	elif stars == 1:
		var messages_1 = [
			"Good work! The pups are grateful!",
			"Nice try! The dogs had fun!",
			"You fed some hungry pups!"
		]
		return messages_1[randi() % messages_1.size()]
	else:
		# Zero stars - extra encouraging, never discouraging
		var messages_0 = [
			"The pups are still hungry! Try again?",
			"Keep practicing! The pups believe in you!",
			"Those treats are tricky! Give it another go!",
			"The dogs are cheering you on!"
		]
		return messages_0[randi() % messages_0.size()]


func _on_replay_pressed() -> void:
	GameManager.replay_level()


func _on_next_pressed() -> void:
	GameManager.next_level()


func _on_menu_pressed() -> void:
	GameManager.go_to_main_menu()
