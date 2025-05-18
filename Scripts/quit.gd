extends Button

@export var next_scene: String = 'res://Scenes/main_menu.tscn'


func _on_pressed() -> void:
	get_tree().change_scene_to_file(next_scene)
