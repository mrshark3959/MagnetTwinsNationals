extends CanvasLayer


	
func _on_visibility_changed() -> void:
	if visible == true:
		$AnimationPlayer.play("blur")
		get_tree().paused = true
	
