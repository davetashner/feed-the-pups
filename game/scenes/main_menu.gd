extends Control
## Main Menu scene - entry point for the game

@onready var play_button: Button = $VBoxContainer/PlayButton
@onready var levels_button: Button = $VBoxContainer/LevelsButton
@onready var title_label: Label = $VBoxContainer/TitleLabel


func _ready() -> void:
	play_button.pressed.connect(_on_play_pressed)
	levels_button.pressed.connect(_on_levels_pressed)


func _on_play_pressed() -> void:
	# Quick play - start at highest unlocked level or level 1
	GameManager.start_level(GameManager.highest_unlocked_level)


func _on_levels_pressed() -> void:
	GameManager.go_to_level_select()
