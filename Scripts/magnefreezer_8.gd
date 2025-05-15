extends Area2D

var value = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_node_or_null(".") != null:
		value = false
		for i in get_overlapping_areas():
			if i.is_in_group("Ftrigger") && Input.is_action_pressed("space"):
				value = true
		#for j in get_node_or_null("../FreezerHelper").get_overlapping_bodies():
			#if j.is_in_group("Player") and j.is_in_group("Player1"):
				#value = false
		get_parent().freeze = !value
