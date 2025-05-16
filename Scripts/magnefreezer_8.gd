extends Area2D

var value = false
var freezecontrol = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if freezecontrol == false:
		return
	else:
		if get_node_or_null(".") != null:
			value = false
			for i in get_overlapping_areas():
				if i.is_in_group("Ftrigger") && Input.is_action_pressed("space"):
					value = true
					print(value)
			#for j in get_node_or_null("../FreezerHelper").get_overlapping_bodies():
				#if j.is_in_group("Player") and j.is_in_group("Player1"):
					#value = false
			get_parent().freeze = !value


func _on_body_entered(body: Node2D) -> void:
	if body == $"../../rotate2" or body == $"../../rotate3":
		disablefreeze()
		
func disablefreeze():
	if value == true:
			value = false
			get_parent().freeze = false
			freezecontrol = false
			print("Freeze control off")
			
	
	






func _on_freezer_helper_body_exited(body: Node2D) -> void:
	if  body == $"../../rotate2" or body == $"../../rotate3" and freezecontrol == false:
		freezecontrol = true
		print("freeze control on")
		
