extends Control
## Level Select scene - grid of levels with stars and lock states
## Placeholder implementation for MVP

@onready var grid: GridContainer = $VBox/GridContainer
@onready var back_button: Button = $VBox/BackButton


func _ready() -> void:
	back_button.pressed.connect(_on_back_pressed)
	_populate_levels()


func _populate_levels() -> void:
	# Clear existing children
	for child in grid.get_children():
		child.queue_free()

	# Create level buttons
	for i in range(1, GameManager.TOTAL_LEVELS + 1):
		var button = Button.new()
		button.custom_minimum_size = Vector2(120, 80)
		button.add_theme_font_size_override("font_size", 24)

		var stars = GameManager.get_level_stars(i)
		var unlocked = GameManager.is_level_unlocked(i)

		if unlocked:
			var star_display = ""
			for s in range(3):
				star_display += "★" if s < stars else "☆"
			button.text = "Level %d\n%s" % [i, star_display]
			button.disabled = false
			button.pressed.connect(_on_level_pressed.bind(i))
		else:
			button.text = "Level %d\n🔒" % i
			button.disabled = true

		grid.add_child(button)


func _on_level_pressed(level_num: int) -> void:
	GameManager.start_level(level_num)


func _on_back_pressed() -> void:
	GameManager.go_to_main_menu()
