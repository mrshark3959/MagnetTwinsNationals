extends Node2D

@onready var main = get_parent()
@onready var ball = load("res://Scenes/enviroment_stuff/bullet_scene.tscn")
@onready var cannon_body = $StaticBody2D

func _on_ready() -> void:
	print(global_position)
	print(cannon_body.global_rotation)

func shoot():
	var angle = cannon_body.global_rotation
	print("Cannon rotation (radians):", angle)
	
	var instance = ball.instantiate()
	instance.dir = Vector2.UP.rotated(angle) # Shoot direction
	instance.spawnpos = cannon_body.global_position # Or use a barrel tip offset if needed
	instance.spawnrot = angle
	
	main.add_child.call_deferred(instance)
	$"../AudioStreamPlayer".play()
