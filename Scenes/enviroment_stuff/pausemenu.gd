extends CanvasLayer


	
func _on_visibility_changed() -> void:
	if visible == true:
	
		get_tree().paused = true
	
