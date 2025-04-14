extends Control

func pause():
	get_tree().paused = true





func _on_ready() -> void:
	get_tree().paused = false
	
	
	
