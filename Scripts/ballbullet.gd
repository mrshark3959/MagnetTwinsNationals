extends CharacterBody2D



@export var SPEED = 80

var dir : float
var spawnpos : Vector2
var spawnrot : float




func _ready() -> void:
	global_position =  spawnpos
	global_rotation = spawnrot
	
func _physics_process(delta: float) -> void:
	velocity = Vector2(0,SPEED).rotated(dir)
	move_and_slide()
