extends AnimationPlayer


func _on_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://loadingscenes/loadingscreen_1.tscn")


func _on_sprite_2d_4_ready() -> void:
	self.stop()
	play("cutscene")
	
