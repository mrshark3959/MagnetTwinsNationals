extends Control

func pause():
	get_tree().paused = true



func _on_resume_ready() -> void:
	$blur.play("blur")
	pause()
