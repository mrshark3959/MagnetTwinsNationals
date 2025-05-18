extends Button

@export var next_scene: String = 'res://Scenes/main_menu.tscn'

func _on_pressed() -> void:
	var next_scene_resource = ResourceLoader.load(next_scene)
	get_tree().change_scene_to_packed(next_scene_resource)
	
