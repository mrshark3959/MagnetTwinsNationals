extends RigidBody2D

@onready var block = $"."
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	custom_integrator = true  # Enable the custom integrator

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	apply_central_impulse(Vector2(0.1, 0.1))  # Apply a central force every frame
	#block.linear_velocity.y = 0
# Implement custom physics behavior
