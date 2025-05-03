extends Button


func _on_pressed() -> void:
	Global.restarts +=1
	get_tree().reload_current_scene()
