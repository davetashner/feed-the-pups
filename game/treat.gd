extends RigidBody2D
## Treat projectile that can be thrown toward dogs

signal caught
signal missed

var has_landed := false

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	contact_monitor = true
	max_contacts_reported = 4

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("floor") and not has_landed:
		has_landed = true
		missed.emit()

func _process(_delta: float) -> void:
	# Remove treat if it falls off screen
	if global_position.y > 1200:
		queue_free()
