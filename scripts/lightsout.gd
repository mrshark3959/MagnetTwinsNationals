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
		grid[y][x] == false
	else:
		grid[y][x] == true


func edgeChecker(x, y):
	var verifyX = (x >= 0 && x < grid[0].length)
	var verifyY = (y >= 0 && y < grid.length)
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
