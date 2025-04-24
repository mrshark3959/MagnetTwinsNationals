extends Node2D
var grid = []
var grid_width = 3
var grid_height = 3

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
				return false
	return true


func edgeChecker(x, y): # broken
	var verifyX = (x >= 0 && x < grid_width)
	var verifyY = (y >= 0 && y < grid_height)
	print(verifyX && verifyY)
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
	if Input.is_action_just_pressed("space"):
		userFlip(1, 1)
	if Input.is_action_just_pressed("w"):
		userFlip(1, 0)
	if Input.is_action_just_pressed("d"):
		userFlip(2, 1)
	if Input.is_action_just_pressed("a"):
		userFlip(0, 1) 
	if Input.is_action_just_pressed("s"):
		userFlip(1, 2)
	if Input.is_action_just_pressed("up"):
		userFlip(0, 0)
	if Input.is_action_just_pressed("right"):
		userFlip(2, 0)
	if Input.is_action_just_pressed("down"):
		userFlip(2, 2)
	if Input.is_action_just_pressed("left"):
		userFlip(0, 2)
