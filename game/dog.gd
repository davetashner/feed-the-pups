extends Area2D
## Dog target that catches treats

signal treat_caught

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body is RigidBody2D and body.has_method("queue_free"):
		# Treat caught!
		treat_caught.emit()

		# Simple catch feedback - flash green
		var sprite = $Body as Sprite2D
		sprite.modulate = Color(0.5, 1.0, 0.5, 1)

		# Remove the treat
		body.queue_free()

		# Reset color after brief flash
		await get_tree().create_timer(0.15).timeout
		sprite.modulate = Color(1, 1, 1, 1)
