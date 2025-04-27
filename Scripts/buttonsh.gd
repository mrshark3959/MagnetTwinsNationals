extends Node2D

signal button_pressed(state: bool)

@onready var collisionshapetop = $StaticBody2D/collisionshapetop
@onready var sprite = $StaticBody2D/AnimatedSprite2D
@onready var hiddenblocks = $"../hiddenblock1"
var onbutton := false  # Track button state
@onready var collisionshape1 = get_node("../hiddenblock1/CollisionShape2D")
@onready var cs2 = get_node("../hiddenblock1/hiddenblock1/CollisionShape2D2") 
@onready var cs3 = get_node("../hiddenblock1/hiddenblock2/CollisionShape2D2")

func _ready() -> void:
	collisionshapetop.position = Vector2(-0.516, -0.5)
	sprite.play("up")

func _on_topchecker_body_entered(body: Node2D) -> void:
	if body.name == "Magnus" or body is RigidBody2D:
		onbutton = true
		_activate_button()
		emit_signal("button_pressed", true)  # Send signal for pressed
		hiddenblocks.visible = true
		collisionshape1.set_deferred("disabled", false)
		cs2.set_deferred("disabled", false)
		cs3.set_deferred("disabled", false)

func _on_topchecker_body_exited(body: Node2D) -> void:
	if body.name == "Magnus" or body is RigidBody2D:
		onbutton = false
		_deactivate_button()
		emit_signal("button_pressed", false)  # Send signal for released
		hiddenblocks.visible = false
		collisionshape1.set_deferred("disabled", true)
		cs2.set_deferred("disabled", true)
		cs3.set_deferred("disabled", true)

func _activate_button() -> void:
	sprite.play("down")
	collisionshapetop.position = Vector2(0, 3)
	$buttonclick.play()
func _deactivate_button() -> void:
	sprite.play("up")
	collisionshapetop.position = Vector2(-0.516, -0.5)
