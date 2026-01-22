extends Node2D
## Greybox prototype for throw mechanics

const TREAT_SCENE = preload("res://treat.tscn")

# Throw tuning
const THROW_POWER_MULTIPLIER := 2.5
const MIN_SWIPE_DISTANCE := 50.0
const MAX_THROW_SPEED := 1500.0

# Trajectory preview settings
const TRAJECTORY_POINTS := 30
const TRAJECTORY_TIME_STEP := 0.05
const GRAVITY := 980.0  # Match Godot's default gravity

# Round settings
const ROUND_DURATION := 30.0

# Swipe tracking
var swipe_start_pos: Vector2 = Vector2.ZERO
var swipe_current_pos: Vector2 = Vector2.ZERO
var swipe_start_time: float = 0.0
var is_swiping := false

# Score tracking
var catches := 0
var misses := 0

# Round state
var time_remaining := ROUND_DURATION
var round_active := false  # Start paused, waiting for button

# Aim assist toggle
var aim_assist_enabled := true

@onready var score_label: Label = $UI/ScoreLabel
@onready var timer_label: Label = $UI/TimerLabel
@onready var round_end_label: Label = $UI/RoundEndLabel
@onready var start_button: Button = $UI/StartButton
@onready var throw_zone: ColorRect = $ThrowZone
@onready var dog: Area2D = $Dog
@onready var trajectory_line: Line2D = $TrajectoryLine
@onready var aim_button: Button = $UI/AimButton

func _ready() -> void:
	dog.treat_caught.connect(_on_treat_caught)
	aim_button.pressed.connect(_on_aim_button_pressed)
	start_button.pressed.connect(_on_start_button_pressed)
	_setup_trajectory_line()
	_update_aim_button_text()
	_show_start_screen()

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
		# Start swipe if in throw zone
		if _is_in_throw_zone(pos):
			swipe_start_pos = pos
			swipe_start_time = Time.get_ticks_msec() / 1000.0
			is_swiping = true
			throw_zone.color = Color(0.5, 0.5, 0.8, 0.5)  # Highlight
	else:
		# End swipe - throw if valid
		if is_swiping:
			var swipe_end_pos := pos
			var swipe_vector := swipe_end_pos - swipe_start_pos

			if swipe_vector.length() >= MIN_SWIPE_DISTANCE:
				_throw_treat(swipe_start_pos, swipe_vector)

			is_swiping = false
			throw_zone.color = Color(0.4, 0.4, 0.6, 0.3)  # Reset
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

	# Calculate initial velocity (same as throw)
	var velocity := swipe_vector * THROW_POWER_MULTIPLIER
	if velocity.length() > MAX_THROW_SPEED:
		velocity = velocity.normalized() * MAX_THROW_SPEED

	# Simulate trajectory points
	var pos := swipe_start_pos
	var vel := velocity

	for i in range(TRAJECTORY_POINTS):
		trajectory_line.add_point(pos)

		# Simple physics step
		vel.y += GRAVITY * TRAJECTORY_TIME_STEP
		pos += vel * TRAJECTORY_TIME_STEP

		# Stop if below floor
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

	# Position treat at swipe start
	treat.global_position = start_pos

	# Calculate throw velocity from swipe
	var velocity := swipe_vector * THROW_POWER_MULTIPLIER

	# Clamp max speed
	if velocity.length() > MAX_THROW_SPEED:
		velocity = velocity.normalized() * MAX_THROW_SPEED

	# Apply velocity to treat
	treat.linear_velocity = velocity

	# Connect miss signal
	treat.missed.connect(_on_treat_missed.bind(treat))

func _on_treat_caught() -> void:
	catches += 1
	_update_score_display()

func _on_treat_missed(_treat: Node) -> void:
	misses += 1

func _on_aim_button_pressed() -> void:
	aim_assist_enabled = not aim_assist_enabled
	_update_aim_button_text()
	if not aim_assist_enabled:
		_clear_trajectory()

func _update_aim_button_text() -> void:
	aim_button.text = "Aim: ON" if aim_assist_enabled else "Aim: OFF"

func _show_start_screen() -> void:
	round_active = false
	throw_zone.visible = false
	round_end_label.text = "Feed the Pups!"
	round_end_label.visible = true
	start_button.text = "Start"
	start_button.visible = true
	timer_label.text = "30"

func _on_start_button_pressed() -> void:
	_start_round()

func _start_round() -> void:
	catches = 0
	misses = 0
	time_remaining = ROUND_DURATION
	round_active = true
	round_end_label.visible = false
	start_button.visible = false
	throw_zone.visible = true
	_update_score_display()
	_update_timer_display()
	_clear_all_treats()

func _end_round() -> void:
	round_active = false
	throw_zone.visible = false
	_clear_trajectory()

	# Show round results
	var total := catches + misses
	var accuracy := 0
	if total > 0:
		accuracy = int((float(catches) / total) * 100)
	round_end_label.text = "Round Over!\nCatches: %d\nAccuracy: %d%%" % [catches, accuracy]
	round_end_label.visible = true
	start_button.text = "Play Again"
	start_button.visible = true

func _update_timer_display() -> void:
	var seconds := int(ceil(time_remaining))
	timer_label.text = "%d" % seconds

	# Flash red when low
	if time_remaining <= 5:
		timer_label.add_theme_color_override("font_color", Color(1, 0.3, 0.3))
	else:
		timer_label.remove_theme_color_override("font_color")

func _update_score_display() -> void:
	score_label.text = "Catches: %d" % catches

func _clear_all_treats() -> void:
	for child in get_children():
		if child is RigidBody2D:
			child.queue_free()
