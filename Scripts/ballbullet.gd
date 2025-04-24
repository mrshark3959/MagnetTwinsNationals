extends CharacterBody2D



@export var SPEED = 80

var dir : float
var spawnpos : Vector2
var spawnrot : float
var g = Vector2.DOWN * 35




func _ready() -> void:
	global_position =  spawnpos
	global_rotation = spawnrot
	print(spawnpos)
	print(spawnrot)
	velocity = Vector2(0,-SPEED).rotated(dir)
func _physics_process(delta: float) -> void:
	velocity += g * delta
	move_and_slide()
