extends Area2D
var snapbody = null;
var positiveType = true;
var positiveMode = true;
@onready var magnetism_sfx: AudioStreamPlayer = $"../magnetism-sfx"
@onready var pin_joint = $"../PinJoint2D"
@onready var pin_joint1 = $"../PinJoint2D2"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if name == 'TriggerNegitive': 
		positiveType = false;
	pin_joint.node_b = NodePath()  # Remove attached body
	pin_joint1.node_b = NodePath()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed('e')):
		positiveMode = !positiveMode
	if positiveType == positiveMode:
		set_gravity(2400)
		if (Input.is_action_pressed("space")):
			get_node("CollisionShape2D").disabled = false
		  # Set exact rotation
			if get_node("Pulse").animation != "pulse":
				get_node("Pulse").play("pulse")
				#print("hi")
			
		else:
			get_node("CollisionShape2D").disabled = true
			pin_joint.node_b = NodePath()  # Remove attached body
			pin_joint1.node_b = NodePath()
			if get_node("Pulse").animation == "pulse":
				get_node("Pulse").animation = "default"
				#print("bye") 
			magnetism_sfx.stop()
		if snapbody is RigidBody2D && Input.is_action_pressed("space"):
			
			snapbody.apply_central_impulse((global_position - snapbody.global_position) * snapbody.mass)
			snapbody.linear_velocity = Vector2(0,0)
			get_node("CollisionShape2D").disabled = true
			
		else: 
			if snapbody is RigidBody2D:
				snapbody.sleeping =true
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
	if Input.is_action_just_released("space") and not Input.is_action_pressed("space"):
		pin_joint.node_b = NodePath()  # Remove attached body
		pin_joint1.node_b = NodePath()  # Remove second joint
		print("Detached body")

func _on_body_entered(body: Node2D) -> void:
	if body is RigidBody2D:
		magnetism_sfx.play();
		
		body.apply_central_impulse(Vector2(0.1, 0.1))
		var target_rotation = 0
		var angular_difference = lerp_angle(body.rotation_degrees, target_rotation, 1)

		# Apply torque to rotate towards 0 degrees
		#body.apply_torque_impulse(angular_difference * 5)  # Adjust the multiplier for strength
		#body.apply_central_impulse(Vector2(0.1, 0.1))

		print(body.rotation_degrees)

#func _on_snap_body_entered(body: Node2D) -> void:
	#if Input.is_action_pressed("space") && snapbody == null && gravity_space_override == Area2D.SPACE_OVERRIDE_REPLACE && positiveType == positiveMode:
	#	if body.is_in_group('Blocks'):
	#		snapbody = body
	#		snapbody.set_collision_layer_value(1, false)


func _on_freezeit_body_entered(body: Node2D) -> void:
	if body is RigidBody2D:
		pin_joint.node_b = body.get_path()  # Attach the rigid body
		pin_joint1.node_b = body.get_path()
		print("Attached:", body.name)
