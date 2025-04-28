extends Node2D


func _on_leftactivation_body_entered(body: RigidBody2D) -> void:
	if body.name  == "handle":
		$"../crumblingplatform2".visible = true
		$"../crumblingplatform".visible = true
		$"../crumblingplatform3".visible = true
		$"../crumblingplatform4".visible = true
		
func _on_rightactivation_body_entered(body: RigidBody2D) -> void:
	if body.name  == "handle":
		$"../crumblingplatform2".visible = false
		$"../crumblingplatform".visible = false
		$"../crumblingplatform3".visible = false
		$"../crumblingplatform4".visible = false
		
