extends Button


func _on_pressed() -> void:
	Global.restarts += 1

	call_deferred("_reload_scene")

func _reload_scene():
	var current_scene = get_tree().current_scene
	if current_scene:
		var scene_path = current_scene.scene_file_path
		get_tree().change_scene_to_file(scene_path)
