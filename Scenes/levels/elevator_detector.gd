extends Area2D







func _on_area_entered(area: Area2D) -> void:
	if area.name == "Elevator" or area.name == 'Nextlevel2':
		$"../Camera2D".reparent($"../../button")
		print("reparenting camera to something else")
