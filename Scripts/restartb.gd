extends Button


func _on_pressed() -> void:
	Global.restarts += 1
	var path = get_tree().current_scene.scene_file_path
	get_tree().change_scene_to_file(path)
