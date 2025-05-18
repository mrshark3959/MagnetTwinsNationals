extends Area2D

@onready var sound = $"../fallensound"
@onready var timer = $"../Timer"  # Make sure the Timer node exists in your scene
var is_respawning = false  # Flag to track if respawn is already in progress

func respawn():
	if is_respawning:
		return  # Exit if respawn is already happening

	is_respawning = true  # Set the flag to true
	sound.play()
	timer.start()  # Start the timer with a 0.2-second delay

func _on_timer_timeout():
	print("timer ended")
	call_deferred("_reload_scene")


func _on_area_entered(area: Area2D) -> void:
	print(area.name)
	if "Snap" in area.name or "Trigger" in area.name:
		print("ferrus trigger detected")
	elif "ferrusarea" in area.name:
		respawn()	
	else:
		print("Something has fallen")
		respawn()

func _on_body_entered(body) -> void:
	if body is PhysicsBody2D:
		respawn()


func _reload_scene():
	await get_tree().process_frame  # Wait a frame to let things settle
	get_tree().reload_current_scene()
