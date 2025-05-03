extends TextureButton

@onready var musicmainm = AudioServer.get_bus_index("mmusic")

func _ready() -> void:
	AudioServer.set_bus_layout(load("res://defaultbus.tres"))
	print(AudioBusLayout)
func _on_pressed() -> void:
	print("Mute button pressed")
	$"../click".play()
	
	# Get the current volume of the bus
	var current_volume = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("mmusic"))
	
	# Check if the volume is at 0 dB and toggle between muted and normal
	if current_volume >= 0:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("mmusic"), -80)  # Mute
	elif current_volume <= 0:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("mmusic"), 0)  # Unmute
