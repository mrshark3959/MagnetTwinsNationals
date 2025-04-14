extends Button

@onready var pausemenu = $"../.."

func _on_pressed() -> void:
	print("a")
	get_tree().paused = false
	pausemenu.visible = false
	
	
