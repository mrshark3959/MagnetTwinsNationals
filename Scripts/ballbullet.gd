extends CharacterBody2D



@export var SPEED = 60

var dir : Vector2
var spawnpos : Vector2
var spawnrot : float
var g = Vector2.DOWN * 35




func _ready() -> void:
	global_position =  spawnpos
	global_rotation = spawnrot
	print(spawnpos)
	print(spawnrot)
	velocity = dir * SPEED
func _physics_process(delta: float) -> void:
	velocity += g * delta
	move_and_slide()
