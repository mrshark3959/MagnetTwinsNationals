extends TextureButton

@onready var musicmainm = AudioServer.get_bus_index("mmusic")
func _ready() -> void:
	AudioServer.set_bus_layout(load('res://defaultbus.tres'))
func _on_pressed() -> void:
	print("Mute button pressed")
	$"../click".play()
	AudioServer.set_bus_mute(musicmainm, not AudioServer.is_bus_mute(musicmainm))
