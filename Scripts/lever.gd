extends Node2D


func _on_leftactivation_body_entered(body: RigidBody2D) -> void:
	if body.name  == "handle":
		$"../slidingdoor2".get_node("AnimatableBody2D").open()
		$"../crumblingplatform2".visible = true
		$"../crumblingplatform".visible = true
		$"../crumblingplatform3".visible = true
		$"../crumblingplatform4".visible = true
		
		$"../crumblingplatform2".set_physics_process(true)
		$"../crumblingplatform3".set_physics_process(true)
		$"../crumblingplatform4".set_physics_process(true)
		$"../crumblingplatform".set_physics_process(true)
		$"../crumblingplatform2".get_node("StaticBody2D/CollisionShape2D").call_deferred("set", "disabled", false)
		$"../crumblingplatform".get_node("StaticBody2D/CollisionShape2D").call_deferred("set", "disabled", false)
		$"../crumblingplatform3".get_node("StaticBody2D/CollisionShape2D").call_deferred("set", "disabled", false)
		$"../crumblingplatform4".get_node("StaticBody2D/CollisionShape2D").call_deferred("set", "disabled", false)
		$"../crumblingplatform2".get_node("Area2D/CollisionShape2D").call_deferred("set", "disabled", false)
		$"../crumblingplatform".get_node("Area2D/CollisionShape2D").call_deferred("set", "disabled", false)
		$"../crumblingplatform3".get_node("Area2D/CollisionShape2D").call_deferred("set", "disabled", false)
		$"../crumblingplatform4".get_node("Area2D/CollisionShape2D").call_deferred("set", "disabled", false)
	
func _on_rightactivation_body_entered(body: RigidBody2D) -> void:
	if body.name  == "handle":
		$"../slidingdoor2".get_node("AnimatableBody2D").close()
		$"../crumblingplatform2".get_node("StaticBody2D").reset()
		$"../crumblingplatform3".get_node("StaticBody2D").reset()
		$"../crumblingplatform4".get_node("StaticBody2D").reset()
		$"../crumblingplatform".get_node("StaticBody2D").reset()
		_on_ready()


func _on_ready() -> void:
	$"../crumblingplatform2".visible = false
	$"../crumblingplatform".visible = false
	$"../crumblingplatform3".visible = false
	$"../crumblingplatform4".visible = false
	$"../crumblingplatform2".set_physics_process(false)
	$"../crumblingplatform3".set_physics_process(false)
	$"../crumblingplatform4".set_physics_process(false)
	$"../crumblingplatform".set_physics_process(false)
	$"../crumblingplatform2".get_node("StaticBody2D/CollisionShape2D").disabled = true
	$"../crumblingplatform".get_node("StaticBody2D/CollisionShape2D").disabled = true
	$"../crumblingplatform3".get_node("StaticBody2D/CollisionShape2D").disabled = true
	$"../crumblingplatform4".get_node("StaticBody2D/CollisionShape2D").disabled = true
	$"../crumblingplatform2".get_node("Area2D/CollisionShape2D").disabled = true
	$"../crumblingplatform".get_node("Area2D/CollisionShape2D").disabled = true
	$"../crumblingplatform3".get_node("Area2D/CollisionShape2D").disabled = true
	$"../crumblingplatform4".get_node("Area2D/CollisionShape2D").disabled = true
