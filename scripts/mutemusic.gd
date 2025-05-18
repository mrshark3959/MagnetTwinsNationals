extends TextureButton

@onready var musicmainm = AudioServer.get_bus_index("mmusic")

func _ready() -> void:
	pass
func _on_pressed() -> void:
	print("Mute button pressed")
	$"../click".play()
	print($"../AudioStreamPlayer".volume_db)
	# Get the current volume of the bus
	var current_volume = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("mmusic"))
	
	# Check if the volume is at 0 dB and toggle between muted and normal
	if current_volume >= 0:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("mmusic"), -80)  # Mute
		$"../AudioStreamPlayer".volume_db = -80
	elif current_volume <= 0:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("mmusic"), 0)  # Unmute
		$"../AudioStreamPlayer".volume_db = 0
