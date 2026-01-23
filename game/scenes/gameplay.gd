extends Node2D
## Gameplay scene - core throwing mechanics
## Refactored from prototype.gd to integrate with GameManager

const TREAT_SCENE = preload("res://treat.tscn")

# Throw tuning
const THROW_POWER_MULTIPLIER := 2.5
const MIN_SWIPE_DISTANCE := 50.0
const MAX_THROW_SPEED := 1500.0

# Trajectory preview settings
const TRAJECTORY_POINTS := 30
const TRAJECTORY_TIME_STEP := 0.05
const GRAVITY := 980.0

# Swipe tracking
var swipe_start_pos: Vector2 = Vector2.ZERO
var swipe_current_pos: Vector2 = Vector2.ZERO
var is_swiping := false

# Score tracking
var catches := 0
var misses := 0
var score := 0
var current_streak := 0
var best_streak := 0

# Scoring constants
const BASE_POINTS := 100
const STREAK_THRESHOLD := 3  # Streak bonus starts at 3 catches
const STREAK_MULTIPLIER := 0.5  # +50% per streak level above threshold

# Round state
var time_remaining := 60.0
var round_active := false

# Aim assist toggle
var aim_assist_enabled := true

@onready var score_label: Label = $UI/ScoreLabel
@onready var timer_label: Label = $UI/TimerLabel
@onready var streak_label: Label = $UI/StreakLabel
@onready var throw_zone: ColorRect = $ThrowZone
@onready var dog: Area2D = $Dog
@onready var trajectory_line: Line2D = $TrajectoryLine
@onready var aim_button: Button = $UI/AimButton
@onready var pause_button: Button = $UI/PauseButton
@onready var pause_overlay: CanvasLayer = $PauseOverlay
@onready var background: TextureRect = $Background


func _ready() -> void:
	dog.treat_caught.connect(_on_treat_caught)
	aim_button.pressed.connect(_on_aim_button_pressed)
	pause_button.pressed.connect(_on_pause_pressed)

	# Pause overlay buttons
	$PauseOverlay/PausePanel/VBox/ResumeButton.pressed.connect(_on_resume_pressed)
	$PauseOverlay/PausePanel/VBox/RestartButton.pressed.connect(_on_restart_pressed)
	$PauseOverlay/PausePanel/VBox/MenuButton.pressed.connect(_on_menu_pressed)

	_setup_trajectory_line()
	_update_aim_button_text()

	# Get level config from GameManager
	var config = GameManager.get_level_config(GameManager.current_level)
	time_remaining = GameManager.LEVEL_DURATION

	# Load background for current level
	var bg_path = GameManager.get_level_background(GameManager.current_level)
	background.texture = load(bg_path)

	# Start immediately (no start button - we came from menu)
	_start_round()


func _process(delta: float) -> void:
	if round_active:
		time_remaining -= delta
		_update_timer_display()

		if time_remaining <= 0:
			_end_round()


func _input(event: InputEvent) -> void:
	if not round_active:
		return

	if event is InputEventMouseButton or event is InputEventScreenTouch:
		_handle_touch(event)
	elif event is InputEventMouseMotion or event is InputEventScreenDrag:
		_handle_drag(event)


func _handle_touch(event: InputEvent) -> void:
	var pos := _get_event_position(event)
	var pressed := _is_pressed(event)

	if pressed:
		if _is_in_throw_zone(pos):
			swipe_start_pos = pos
			is_swiping = true
			throw_zone.color = Color(0.5, 0.5, 0.8, 0.5)
	else:
		if is_swiping:
			var swipe_end_pos := pos
			var swipe_vector := swipe_end_pos - swipe_start_pos

			if swipe_vector.length() >= MIN_SWIPE_DISTANCE:
				_throw_treat(swipe_start_pos, swipe_vector)

			is_swiping = false
			throw_zone.color = Color(0.4, 0.4, 0.6, 0.3)
			_clear_trajectory()


func _handle_drag(event: InputEvent) -> void:
	if is_swiping:
		swipe_current_pos = _get_drag_position(event)
		_update_trajectory_preview()


func _get_drag_position(event: InputEvent) -> Vector2:
	if event is InputEventMouseMotion:
		return event.position
	elif event is InputEventScreenDrag:
		return event.position
	return Vector2.ZERO


func _setup_trajectory_line() -> void:
	trajectory_line.width = 4.0
	trajectory_line.default_color = Color(1.0, 0.8, 0.2, 0.7)
	trajectory_line.clear_points()


func _update_trajectory_preview() -> void:
	trajectory_line.clear_points()

	if not aim_assist_enabled:
		return

	var swipe_vector := swipe_current_pos - swipe_start_pos
	if swipe_vector.length() < MIN_SWIPE_DISTANCE:
		return

	var velocity := swipe_vector * THROW_POWER_MULTIPLIER
	if velocity.length() > MAX_THROW_SPEED:
		velocity = velocity.normalized() * MAX_THROW_SPEED

	var pos := swipe_start_pos
	var vel := velocity

	for i in range(TRAJECTORY_POINTS):
		trajectory_line.add_point(pos)
		vel.y += GRAVITY * TRAJECTORY_TIME_STEP
		pos += vel * TRAJECTORY_TIME_STEP
		if pos.y > 1030:
			break


func _clear_trajectory() -> void:
	trajectory_line.clear_points()


func _get_event_position(event: InputEvent) -> Vector2:
	if event is InputEventMouseButton:
		return event.position
	elif event is InputEventScreenTouch:
		return event.position
	return Vector2.ZERO


func _is_pressed(event: InputEvent) -> bool:
	if event is InputEventMouseButton:
		return event.pressed
	elif event is InputEventScreenTouch:
		return event.pressed
	return false


func _is_in_throw_zone(pos: Vector2) -> bool:
	var rect := throw_zone.get_global_rect()
	return rect.has_point(pos)


func _throw_treat(start_pos: Vector2, swipe_vector: Vector2) -> void:
	var treat = TREAT_SCENE.instantiate()
	add_child(treat)
	treat.global_position = start_pos

	var velocity := swipe_vector * THROW_POWER_MULTIPLIER
	if velocity.length() > MAX_THROW_SPEED:
		velocity = velocity.normalized() * MAX_THROW_SPEED

	treat.linear_velocity = velocity
	treat.missed.connect(_on_treat_missed.bind(treat))


func _on_treat_caught() -> void:
	catches += 1
	current_streak += 1
	if current_streak > best_streak:
		best_streak = current_streak

	# Calculate points with streak bonus
	var points := BASE_POINTS
	if current_streak >= STREAK_THRESHOLD:
		var streak_level := current_streak - STREAK_THRESHOLD + 1
		var multiplier := 1.0 + (streak_level * STREAK_MULTIPLIER)
		points = int(BASE_POINTS * multiplier)

	score += points
	_update_score_display()
	_update_streak_display()


func _on_treat_missed(_treat: Node) -> void:
	misses += 1
	current_streak = 0
	_update_streak_display()


func _on_aim_button_pressed() -> void:
	aim_assist_enabled = not aim_assist_enabled
	_update_aim_button_text()
	if not aim_assist_enabled:
		_clear_trajectory()


func _update_aim_button_text() -> void:
	aim_button.text = "Aim: ON" if aim_assist_enabled else "Aim: OFF"


func _start_round() -> void:
	catches = 0
	misses = 0
	score = 0
	current_streak = 0
	best_streak = 0
	time_remaining = GameManager.LEVEL_DURATION
	round_active = true
	throw_zone.visible = true
	pause_overlay.visible = false
	_update_score_display()
	_update_streak_display()
	_update_timer_display()
	_clear_all_treats()


func _end_round() -> void:
	round_active = false
	throw_zone.visible = false
	_clear_trajectory()

	# Transition to results screen via GameManager
	GameManager.show_results(score, catches, misses)


func _update_timer_display() -> void:
	var seconds := int(ceil(time_remaining))
	timer_label.text = "%d" % seconds

	if time_remaining <= 5:
		timer_label.add_theme_color_override("font_color", Color(1, 0.3, 0.3))
	else:
		timer_label.remove_theme_color_override("font_color")


func _update_score_display() -> void:
	score_label.text = "Score: %d" % score


func _update_streak_display() -> void:
	if current_streak >= STREAK_THRESHOLD:
		streak_label.text = "Streak: %d! 🔥" % current_streak
		streak_label.add_theme_color_override("font_color", Color(1, 0.6, 0.2))
		streak_label.visible = true
	elif current_streak > 0:
		streak_label.text = "Streak: %d" % current_streak
		streak_label.remove_theme_color_override("font_color")
		streak_label.visible = true
	else:
		streak_label.visible = false


func _clear_all_treats() -> void:
	for child in get_children():
		if child is RigidBody2D:
			child.queue_free()


## Pause handling

func _on_pause_pressed() -> void:
	round_active = false
	pause_overlay.visible = true
	get_tree().paused = true


func _on_resume_pressed() -> void:
	pause_overlay.visible = false
	get_tree().paused = false
	round_active = true


func _on_restart_pressed() -> void:
	get_tree().paused = false
	GameManager.replay_level()


func _on_menu_pressed() -> void:
	get_tree().paused = false
	GameManager.go_to_main_menu()
