extends Area2D
var snapbody = null;
var positiveType = true;
var positiveMode = true;
@onready var magnetism_sfx: AudioStreamPlayer = $"../magnetism-sfx"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if name == 'TriggerNegitive': 
		positiveType = false;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed('e')):
		positiveMode = !positiveMode
	if positiveType == positiveMode:
		set_gravity(4000)
		if (Input.is_action_pressed("space")):
			get_node("CollisionShape2D").disabled = false
			if get_node("Pulse").animation != "pulse":
				get_node("Pulse").play("pulse")
				#print("hi")
			
		else:
			get_node("CollisionShape2D").disabled = true
			if get_node("Pulse").animation == "pulse":
				get_node("Pulse").animation = "default"
				#print("bye") 
			magnetism_sfx.stop()
		if snapbody is RigidBody2D && Input.is_action_pressed("space"):
			
			snapbody.global_transform.origin = global_position
			snapbody.linear_velocity = Vector2(0,0)
			get_node("CollisionShape2D").disabled = true
			
		else: 
			if snapbody is RigidBody2D:
				snapbody.freeze = false
				snapbody.set_collision_layer_value(1, true)
			snapbody = null
	else:
		set_gravity(-2500)
		snapbody = null
		if (Input.is_action_pressed("space")):
			get_node("CollisionShape2D").disabled = false
			
			
			if get_node("Pulse").animation != "pulse":
				get_node("Pulse").play("pulse")
				#print("hi")
		else:
			get_node("CollisionShape2D").disabled = true
			if get_node("Pulse").animation == "pulse":
				get_node("Pulse").animation = "default"
				#print("bye")
	#print(positiveMode==positiveType)


func _on_body_entered(body: Node2D) -> void:
	if body is RigidBody2D:
		magnetism_sfx.play();
		body.apply_central_impulse(Vector2(0.1, 0.1))


#func _on_snap_body_entered(body: Node2D) -> void:
	#if Input.is_action_pressed("space") && snapbody == null && gravity_space_override == Area2D.SPACE_OVERRIDE_REPLACE && positiveType == positiveMode:
	#	if body.is_in_group('Blocks'):
	#		snapbody = body
	#		snapbody.set_collision_layer_value(1, false)
