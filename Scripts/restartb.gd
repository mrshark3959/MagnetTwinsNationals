extends Button

func _on_pressed() -> void:
	Global.restarts += 1
	# Use call_deferred to avoid issues with scene switching mid-frame
	call_deferred("_reload_scene")

func _reload_scene() -> void:
	if Global.level != "":
		var err = get_tree().change_scene_to_file(Global.level)
		if err != OK:
			print("Error changing scene:", err)
	else:
		print("Global.current_scene_path is empty! Can't reload.")
