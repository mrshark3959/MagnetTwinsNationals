extends StaticBody2D





var rotation_speed = 90.0  
var direction = 1  # -1 for left, 1 for right, 0 for no rotation

func _process(delta):
  
	rotation_degrees += rotation_speed * direction * delta
