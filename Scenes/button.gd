extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D3.frame = 1
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	AudioServer.set_bus_layout(load("res://defaultbus.tres"))
	var current_volume = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("cutsce"))
	

	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("cutsce"), -80)  # Mute
	$"../click".play()
	$"../Timer1".start()
	
	
	
	
func _on_timer_1_timeout() -> void:
	pass
	get_tree().change_scene_to_file("res://loadingscenes/loadingscreen_1.tscn")
