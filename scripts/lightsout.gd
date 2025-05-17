extends Node2D
var grid = []
var grid_width = 3
var grid_height = 3
var validated = false

signal lights_solved(state: bool)

func _init():
	grid=Array()
	grid.resize(grid_height)
	for i in range(grid_height):
		grid[i] = Array()
		grid[i].resize(grid_width)
		for j in range(grid_width):
			grid[i][j] = false;

func flip(x, y):
	if grid[y][x] == true:
		grid[y][x] = false
		tilePicker(x, y, "off")
	else:
		grid[y][x] = true
		tilePicker(x, y, "on")
		
func tilePicker(x, y, anim):
	if (x == 0 && y == 0):
		$"00/AnimatedSprite2D".play(anim)
	if (x == 1 && y == 0):
		$"01/AnimatedSprite2D".play(anim)
	if (x == 2 && y == 0):
		$"02/AnimatedSprite2D".play(anim)
	if (x == 0 && y == 1):
		$"10/AnimatedSprite2D".play(anim)
	if (x == 1 && y == 1):
		$"11/AnimatedSprite2D".play(anim)
	if (x == 2 && y == 1):
		$"12/AnimatedSprite2D".play(anim)
	if (x == 0 && y == 2):
		$"20/AnimatedSprite2D".play(anim)
	if (x == 1 && y == 2):
		$"21/AnimatedSprite2D".play(anim)
	if (x == 2 && y == 2):
		$"22/AnimatedSprite2D".play(anim)


func validate_grid():
	for row in grid:
		for col in row:
			if col == false:
				#$"powersource".play("off")
				return false
	$"powersource".play("on")
	return true


func edgeChecker(x, y): # broken
	var verifyX = (x >= 0 && x < grid_width)
	var verifyY = (y >= 0 && y < grid_height)
	#print(verifyX && verifyY)
	return verifyX && verifyY
	
func adjacentFlip(x, y):  
	#top
	if edgeChecker(x, y-1):
		flip(x, y-1)
	#bot
	if edgeChecker(x, y+1):
		flip(x, y+1)
	#right
	if (edgeChecker(x+1, y)):
		flip(x+1, y)
	#left
	if (edgeChecker(x-1, y)):
		flip(x-1, y)

func userFlip(x, y):
	flip(x, y)
	adjacentFlip(x, y)

func _ready():
	_init()

func _physics_process(delta: float) -> void:
	if validate_grid() and !validated:
		validated = true
		print("all lit up")
		emit_signal("lights_solved", true)
		$"../slidingdoortop".get_node("AnimatableBody2D").open()




#THE CODE BEHEMOTH
func _on_00_body_entered(body: Node2D) -> void:
	#print("in")
	if body.is_in_group("Player"):
		userFlip(0, 0)

func _on_01_body_entered(body: Node2D) -> void:
	#print("in")
	if body.is_in_group("Player"):
		userFlip(1, 0)


func _on_02_body_entered(body: Node2D) -> void:
	#print("in")
	if body.is_in_group("Player"):
		userFlip(2, 0)


func _on_10_body_entered(body: Node2D) -> void:
	#print("in")
	if body.is_in_group("Player"):
		userFlip(0, 1)


func _on_11_body_entered(body: Node2D) -> void:
	#print("in")
	if body.is_in_group("Player"):
		userFlip(1, 1)


func _on_12_body_entered(body: Node2D) -> void:
	#print("in")
	if body.is_in_group("Player"):
		userFlip(2, 1)


func _on_20_body_entered(body: Node2D) -> void:
	#print("in")
	if body.is_in_group("Player"):
		userFlip(0, 2)


func _on_21_body_entered(body: Node2D) -> void:
	#print("in")
	if body.is_in_group("Player"):
		userFlip(1, 2)


func _on_22_body_entered(body: Node2D) -> void:
	#print("in")
	if body.is_in_group("Player"):
		userFlip(2, 2)
