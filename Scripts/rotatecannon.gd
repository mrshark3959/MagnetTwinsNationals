extends StaticBody2D

@onready var rotation_speed = 1
@onready var rotationdirection = 0

func aimleft(delta):
	# Check if we're not already at 0 degrees (with a small tolerance)
	if self.rotation > deg_to_rad(0.1):  
		print("not zero degrees rotating left")
		self.rotation -= rotation_speed * delta
	
		if self.rotation < deg_to_rad(0.1): 
			self.rotation = deg_to_rad(0)  
			stoprotate()
			print("DONE")

func aimright(delta):

	if self.rotation < deg_to_rad(90 - 0.1):  
		print("not 180 degrees rotating right")
		self.rotation += rotation_speed * delta

		if self.rotation > deg_to_rad(90 - 0.1):  
			self.rotation = deg_to_rad(90) 
			print("at 90 degress")
			stoprotate()

func stoprotate():
	rotationdirection = 0 
func rdirection():
	rotationdirection = 1
func ldirection():
	rotationdirection = -1
func _process(delta: float) -> void:
	if rotationdirection == -1:
		aimleft(delta)
	if rotationdirection == 1:
		aimright(delta)
