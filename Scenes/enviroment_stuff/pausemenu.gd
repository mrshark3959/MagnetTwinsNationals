extends CanvasLayer


	



func _on_visibility_changed() -> void:
	if visible:
		$AnimationPlayer.play("blur")
		get_tree().paused = true
	else:
		get_tree().paused = false
