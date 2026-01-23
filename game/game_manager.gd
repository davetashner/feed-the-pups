extends Node
## GameManager - Singleton managing game state, scene transitions, and player progress
## See ADR-008 for architecture decisions

# Game states
enum GameState {
	MAIN_MENU,
	LEVEL_SELECT,
	PLAYING,
	PAUSED,
	RESULTS
}

# Signals for loose coupling
signal state_changed(new_state: GameState)
signal level_started(level_num: int)
signal level_completed(level_num: int, score: int, stars: int)

# Current state
var current_state: GameState = GameState.MAIN_MENU
var current_level: int = 1

# Level progress (stars earned per level, 0 = not played, 1-3 = stars)
var level_stars: Array[int] = []
var highest_unlocked_level: int = 1

# Scene references (preloaded for instant transitions)
var _scenes: Dictionary = {}

# Scene paths
const SCENE_PATHS = {
	"main_menu": "res://scenes/main_menu.tscn",
	"level_select": "res://scenes/level_select.tscn",
	"gameplay": "res://scenes/gameplay.tscn",
	"results": "res://scenes/results.tscn"
}

# Level configuration from game-design-parameters.md
const TOTAL_LEVELS = 10
const LEVEL_DURATION = 60.0  # seconds

# Background textures by location
const BACKGROUNDS = {
	"kitchen": "res://assets/backgrounds/bg_kitchen_main.png",
	"paris": "res://assets/backgrounds/bg_paris_main.png",
	"texas": "res://assets/backgrounds/bg_texas_main.png",
	"italy": "res://assets/backgrounds/bg_italy_main.png",
	"riverside": "res://assets/backgrounds/bg_oriental_main.png",
}

# Per-level settings (visibility window, spawn interval, background)
const LEVEL_CONFIG = [
	{"visibility": 4.0, "spawn_interval": 5.0, "dogs_max": 1, "location": "kitchen"},   # Level 1
	{"visibility": 3.85, "spawn_interval": 4.8, "dogs_max": 2, "location": "kitchen"},  # Level 2
	{"visibility": 3.70, "spawn_interval": 4.6, "dogs_max": 2, "location": "paris"},    # Level 3
	{"visibility": 3.55, "spawn_interval": 4.4, "dogs_max": 2, "location": "paris"},    # Level 4
	{"visibility": 3.40, "spawn_interval": 4.2, "dogs_max": 3, "location": "texas"},    # Level 5
	{"visibility": 3.25, "spawn_interval": 4.0, "dogs_max": 3, "location": "texas"},    # Level 6
	{"visibility": 3.10, "spawn_interval": 3.8, "dogs_max": 3, "location": "italy"},    # Level 7
	{"visibility": 2.95, "spawn_interval": 3.6, "dogs_max": 4, "location": "italy"},    # Level 8
	{"visibility": 2.80, "spawn_interval": 3.4, "dogs_max": 4, "location": "riverside"},  # Level 9
	{"visibility": 2.65, "spawn_interval": 3.2, "dogs_max": 5, "location": "riverside"},  # Level 10
]

# Results from last completed level (for results screen)
var last_level_score: int = 0
var last_level_stars: int = 0
var last_level_catches: int = 0
var last_level_misses: int = 0


func _ready() -> void:
	# Initialize level stars array
	level_stars.resize(TOTAL_LEVELS)
	level_stars.fill(0)

	# Preload scenes for instant transitions
	_preload_scenes()

	# Load saved progress
	_load_progress()


func _preload_scenes() -> void:
	for scene_name in SCENE_PATHS:
		var path = SCENE_PATHS[scene_name]
		if ResourceLoader.exists(path):
			_scenes[scene_name] = load(path)


## Scene transition methods

func go_to_main_menu() -> void:
	_change_state(GameState.MAIN_MENU)
	_change_scene("main_menu")


func go_to_level_select() -> void:
	_change_state(GameState.LEVEL_SELECT)
	_change_scene("level_select")


func start_level(level_num: int) -> void:
	current_level = clampi(level_num, 1, TOTAL_LEVELS)
	_change_state(GameState.PLAYING)
	_change_scene("gameplay")
	level_started.emit(current_level)


func show_results(score: int, catches: int, misses: int) -> void:
	last_level_score = score
	last_level_catches = catches
	last_level_misses = misses
	last_level_stars = _calculate_stars(score, catches, misses)

	# Update progress
	_record_level_completion(current_level, last_level_stars)

	_change_state(GameState.RESULTS)
	_change_scene("results")
	level_completed.emit(current_level, score, last_level_stars)


func replay_level() -> void:
	start_level(current_level)


func next_level() -> void:
	if current_level < TOTAL_LEVELS:
		start_level(current_level + 1)
	else:
		go_to_level_select()


## Pause handling (overlay, not scene change)

func pause_game() -> void:
	if current_state == GameState.PLAYING:
		_change_state(GameState.PAUSED)
		get_tree().paused = true


func resume_game() -> void:
	if current_state == GameState.PAUSED:
		_change_state(GameState.PLAYING)
		get_tree().paused = false


## Level configuration helpers

func get_level_config(level_num: int) -> Dictionary:
	var idx = clampi(level_num - 1, 0, LEVEL_CONFIG.size() - 1)
	return LEVEL_CONFIG[idx]


func get_level_background(level_num: int) -> String:
	var config = get_level_config(level_num)
	var location = config.get("location", "kitchen")
	return BACKGROUNDS.get(location, BACKGROUNDS["kitchen"])


func is_level_unlocked(level_num: int) -> bool:
	return level_num <= highest_unlocked_level


func get_level_stars(level_num: int) -> int:
	var idx = level_num - 1
	if idx >= 0 and idx < level_stars.size():
		return level_stars[idx]
	return 0


## Internal methods

func _change_state(new_state: GameState) -> void:
	current_state = new_state
	state_changed.emit(new_state)


func _change_scene(scene_name: String) -> void:
	if _scenes.has(scene_name) and _scenes[scene_name] != null:
		get_tree().change_scene_to_packed(_scenes[scene_name])
	elif SCENE_PATHS.has(scene_name):
		# Fallback to file load if not preloaded
		get_tree().change_scene_to_file(SCENE_PATHS[scene_name])
	else:
		push_error("GameManager: Unknown scene: " + scene_name)


func _calculate_stars(score: int, catches: int, misses: int) -> int:
	# Star thresholds based on accuracy (from game-design-parameters.md)
	# 1 star: 40% accuracy, 2 stars: 65%, 3 stars: 85%
	var total = catches + misses
	if total == 0:
		return 0

	var accuracy = float(catches) / float(total)

	if accuracy >= 0.85:
		return 3
	elif accuracy >= 0.65:
		return 2
	elif accuracy >= 0.40:
		return 1
	else:
		return 0


func _record_level_completion(level_num: int, stars: int) -> void:
	var idx = level_num - 1
	if idx >= 0 and idx < level_stars.size():
		# Only update if better than previous
		if stars > level_stars[idx]:
			level_stars[idx] = stars

	# Unlock next level (completing any level unlocks next, per soft failure design)
	if level_num >= highest_unlocked_level and level_num < TOTAL_LEVELS:
		highest_unlocked_level = level_num + 1

	_save_progress()


## Persistence

const SAVE_PATH = "user://progress.json"

func _save_progress() -> void:
	var data = {
		"highest_unlocked_level": highest_unlocked_level,
		"level_stars": level_stars
	}
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(data))
		file.close()


func _load_progress() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		return

	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file:
		var json = JSON.new()
		var error = json.parse(file.get_as_text())
		file.close()

		if error == OK:
			var data = json.data
			if data.has("highest_unlocked_level"):
				highest_unlocked_level = data["highest_unlocked_level"]
			if data.has("level_stars"):
				for i in range(mini(data["level_stars"].size(), level_stars.size())):
					level_stars[i] = data["level_stars"][i]
