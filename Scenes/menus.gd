extends Button

@onready var pause_menu = $"pause menu" # Adjust the path as needed
func _on_pressed() -> void:

	pause_menu.visible = true
   
