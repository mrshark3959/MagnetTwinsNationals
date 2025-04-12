extends Button


func _on_pressed() -> void:
	var pause_menu = get_node("res://Scenes/enviroment_stuff/pausemenu.tscn") # Adjust the path as needed
	pause_menu.visible = true
   
