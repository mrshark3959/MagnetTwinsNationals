extends AnimationPlayer


func _on_animation_finished(anim_name: StringName) -> void:
	var current_volume = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("cutsce"))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("cutsce"), -80)  # Mute
	print('muted')
	get_tree().change_scene_to_file("res://loadingscenes/loadingscreen_1.tscn")


func _on_sprite_2d_4_ready() -> void:
	play("cutscene")
	
