extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.level = "res://Scenes/levels/level_1.tscn"
	print(Global.level)
	var current_volume = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("cutsce"))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("cutsce"), -80)  # Mute
	Backgroundaudio.play_music()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	pass # Replace with function body.
