extends CharacterBody2D

var PUSH_FORCE = 0
var MIN_PUSH_FORCE = 5
var is_color_red = true
var input_direction
@onready var pin_joint = $"PinJoint2D"

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
		if (is_color_red == true):
			is_color_red = false
			get_node("Texture/AnimationPlayer").clear_queue()
			get_node("Texture/AnimationPlayer").queue("to_blue")
			get_node("Texture/AnimationPlayer").queue("blue_idle")
			print("turning blue")
		elif (is_color_red == false):
			is_color_red = true
			get_node("Texture/AnimationPlayer").clear_queue()
			get_node("Texture/AnimationPlayer").queue("to_red")
			get_node("Texture/AnimationPlayer").queue("red_idle")

			print("turning red")
	

func _physics_process(_delta):
	var skipmove = Vector2.ZERO
	var fakearea = ShapeCast2D.new()
	get_input()
	if pin_joint.node_b != NodePath():
		if get_node(pin_joint.node_b) is RigidBody2D:
			fakearea.shape = get_node(pin_joint.node_b).get_node("CollisionShape2D").shape
			fakearea.transform = get_node(pin_joint.node_b).get_node("CollisionShape2D").transform
			fakearea.position = get_node(pin_joint.node_b).get_node("CollisionShape2D").position
			fakearea.target_position = (velocity*160*_delta)
			fakearea.add_exception(get_node(pin_joint.node_b))
			get_node(pin_joint.node_b).add_child(fakearea)
			fakearea.force_shapecast_update()
			if fakearea.is_colliding():
				#print("HEY")
				pass
			else:
				move_and_collide(velocity*160*_delta)
			get_node(pin_joint.node_b).remove_child(fakearea)
	else:
		move_and_collide(velocity*160*_delta)



func bodycheck(body):
	if body is TileMapLayer:
		return true

func pull_object():
	ShapeCast2D

func blink():
	if randf_range(0, 10) > 8:
		get_node("Texture").play("Blink")

func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	blink()


#func _on_texture_animation_looped() -> void:
	#get_node("Texture").play("Default")
	
