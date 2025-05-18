extends Button


func _on_pressed() -> void:
	Global.restarts += 1
	get_tree().change_scene_to_file(Global.level)
