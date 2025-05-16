extends Area2D
var snapbody = null;
var positiveType = true;
var positiveMode = true;
@onready var magnetism_sfx: AudioStreamPlayer = $"../magnetism-sfx"
@onready var ogpj1 = $"../PinJoint2D"
@onready var ogpj2 = $"../PinJoint2D2"
var pin_joint = []
var pin_joint1 = []
var shapegroup = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if name == 'TriggerNegitive': 
		positiveType = false;
	shapegroup = get_parent().get_node_or_null("freezeit")
	_clearpins()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if get_parent() != null:
		if (Input.is_action_just_pressed('e')):
			positiveMode = !positiveMode
		if positiveType == positiveMode:
			set_gravity(2400)
			if get_parent().get_node_or_null("freezeit") != null:
				get_parent().get_node_or_null("freezeit").set_collision_mask_value(4, true)
				get_parent().get_node_or_null("freezeit").set_collision_mask_value(3, false)
			if (Input.is_action_pressed("space")):
				get_node_or_null("CollisionShape2D").disabled = false
			  # Set exact rotation
				if get_node_or_null("Pulse").animation != "pulse":
					get_node_or_null("Pulse").play("pulse")
					#print("hi")
				
			else:
				get_node_or_null("CollisionShape2D").disabled = true
				_clearpins()
				if get_node_or_null("Pulse").animation == "pulse":
					get_node_or_null("Pulse").animation = "default"
					#print("bye") 
				magnetism_sfx.stop()
		else:
			set_gravity(-2500)
			if get_parent().get_node_or_null("freezeit") != null:
				get_parent().get_node_or_null("freezeit").set_collision_mask_value(3, true)
				get_parent().get_node_or_null("freezeit").set_collision_mask_value(4, false)
			if (Input.is_action_pressed("space")):
				get_node_or_null("CollisionShape2D").disabled = false
				
				
				if get_node_or_null("Pulse").animation != "pulse":
					get_node_or_null("Pulse").play("pulse")
					#print("hi")
			else:
				get_node_or_null("CollisionShape2D").disabled = true
				if get_node_or_null("Pulse").animation == "pulse":
					get_node_or_null("Pulse").animation = "default"
					#print("bye")
		#print(positiveMode==positiveType)
		if Input.is_action_just_released("space") and not Input.is_action_pressed("space"):
			_clearpins()
			print("Detached body")
		
		var ids = []
		for i in pin_joint:
			var a = get_node_or_null(i.node_b).get_instance_id()
			ids.append(a)
		
		if get_parent().get_node_or_null("freezeit") != null:
			#print("hai")
			for body in get_parent().get_node_or_null("freezeit").get_overlapping_bodies():
				if body is RigidBody2D && Input.is_action_pressed("space") && body.get_instance_id() not in ids:
					var pj = ogpj1.duplicate()
					get_parent().add_child(pj)
					pin_joint.append(pj)
					pj.node_b = body.get_path()
					var pj2 = ogpj2.duplicate()
					get_parent().add_child(pj2)
					pin_joint.append(pj2)
					pj2.node_b = body.get_path()
					#body.set_collision_layer_value(1, false)
					for i in pin_joint:
						body.add_collision_exception_with(get_node_or_null(i.node_b))
					var s = CollisionShape2D.new()
					s.shape = body.get_node_or_null("CollisionShape2D").shape
					shapegroup.add_child(s)
					s.global_transform = body.get_node_or_null("CollisionShape2D").global_transform
					s.scale = s.scale * 1.05
					print("Attached:", body.name)
				# Apply torque to rotate towards 0 degrees
		#body.apply_torque_impulse(angular_difference * 5)  # Adjust the multiplier for strength
		#body.apply_central_impulse(Vector2(0.1, 0.1))
func _on_body_entered(body: Node2D) -> void:
	if body == $"../../rotate2" or body == $"../../rotate3":
		fublockspace()
		return
	else:
		if body is RigidBody2D:
			
			magnetism_sfx.play();
			
			body.apply_central_impulse(Vector2(0.1, 0.1))
			var target_rotation = 0
			var angular_difference = lerp_angle(body.rotation_degrees, target_rotation, 1)
			print(body.rotation_degrees)
func fublockspace():
	if Input.is_action_pressed("space"):
		print("rotational device found")
		get_node_or_null("CollisionShape2D").disabled = true
		get_node_or_null("CollisionShape2D").disabled = true
		get_parent().get_node_or_null("freezeit").set_collision_mask_value(3, false)
		get_parent().get_node_or_null("freezeit").set_collision_mask_value(4, false)
		_clearpins()
		

		

		
		
		
func _clearpins() -> void:
	for pj in pin_joint:
		for i in get_node_or_null(pj.node_b).get_collision_exceptions():
			get_node_or_null(pj.node_b).remove_collision_exception_with(i)
		get_parent().remove_child(pj)
	for pj in pin_joint1:
		for i in get_node_or_null(pj.node_b).get_collision_exceptions():
			get_node_or_null(pj.node_b).remove_collision_exception_with(i)
		get_parent().remove_child(pj)
	pin_joint = []  # Remove attached body
	pin_joint1 = []
	if shapegroup.get_child_count() != 0:
		for i in shapegroup.get_children():
			if !i.is_in_group("Player"):
				shapegroup.remove_child(i)
				i = null




	
	


func _on_trigger_positive_body_entered(body: Node2D) -> void:
	if body == $"../../rotate2" or body == $"../../rotate3":
		print("FERRIS HIT BY ROTATION")
		fublockspace()
		return
	else:
		if body is RigidBody2D:
			
			magnetism_sfx.play();
			
			body.apply_central_impulse(Vector2(0.1, 0.1))
			var target_rotation = 0
			var angular_difference = lerp_angle(body.rotation_degrees, target_rotation, 1)
			print(body.rotation_degrees)
