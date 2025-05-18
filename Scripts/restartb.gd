extends Button

func _on_pressed() -> void:
	# Use call_deferred to avoid issues with scene switching mid-frame
	call_deferred("_reload_scene")

func _reload_scene() -> void:
	get_tree().reload_current_scene()
