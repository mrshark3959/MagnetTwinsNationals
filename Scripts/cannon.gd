extends Node2D

@onready var main = get_parent()
@onready var ball = load("res://Scenes/enviroment_stuff/bullet_scene.tscn")


func _on_ready() -> void:
	print(global_position)
	print(rotation)


func shoot():
	var instance = ball.instantiate()
	print(instance)
	instance.dir = rotation
	instance.spawnpos = global_position 
	instance.spawnrot = rotation
	main.add_child.call_deferred(instance)
	
