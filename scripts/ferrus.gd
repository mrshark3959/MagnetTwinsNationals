extends CharacterBody2D

var PUSH_FORCE = 0
var MIN_PUSH_FORCE = 5
var is_color_red = true
var input_direction
var frozen = false

var pin_joints

func _ready() -> void:
	pass

func get_input():
	input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction
	if input_direction.x > 0:
		get_node("Texture").flip_h = true
	if input_direction.x < 0:
		get_node("Texture").flip_h = false
	if Input.is_action_just_pressed("e"):
		if is_color_red:
			is_color_red = false
			get_node("Texture/AnimationPlayer").clear_queue()
			get_node("Texture/AnimationPlayer").queue("to_blue")
			get_node("Texture/AnimationPlayer").queue("blue_idle")
			print("turning blue")
		else:
			is_color_red = true
			get_node("Texture/AnimationPlayer").clear_queue()
			get_node("Texture/AnimationPlayer").queue("to_red")
			get_node("Texture/AnimationPlayer").queue("red_idle")
			print("turning red")
			
	var tn = $"TriggerPositive".pin_joint
	var tp = $"TriggerNegitive".pin_joint
	pin_joints = tn + tp;

func _physics_process(_delta):
	if frozen:
		velocity = Vector2.ZERO
		return

	var fakearea = ShapeCast2D.new()
	get_input()
	if pin_joints != []:
		#print(pin_joints)
		for pin_joint in pin_joints:
				#get_node("freezeit/CollisionShape2D").disabled = true
				
				if get_node(pin_joint.node_b) is RigidBody2D:
					var target_node = get_node(pin_joint.node_b)
					var collision_shape = target_node.get_node("CollisionShape2D")
					fakearea = target_node.move_and_collide(velocity * 160 * _delta, true)
					if fakearea != null:
						break
	else:
		move_and_collide(velocity * 160 * _delta)
	if fakearea == null:
		move_and_collide(velocity * 160 * _delta, false, 1)

func freeze():
	frozen = true
	velocity = Vector2.ZERO

func unfreeze():
	frozen = false

func bodycheck(body):
	if body is TileMapLayer:
		return true

func pull_object():
	ShapeCast2D  # Placeholder — implement this as needed

func blink():
	if randf_range(0, 10) > 8:
		get_node("Texture").play("Blink")

func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	blink()
