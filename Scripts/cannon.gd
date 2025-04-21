extends Node2D

@onready var main = get_tree().get_root().get_node("main")
@onready var ball = load("res://Scenes/enviroment_stuff/bullet_scene.tscn")


func _on_ready() -> void:
	shoot()



func shoot():
	var instance = ball.instantiate()
	print(instance)
	instance.dir = rotation
	instance.spawnpos = global_position
	instance.spawnrot = rotation
	main.add_child.call_deferred(instance)
	
