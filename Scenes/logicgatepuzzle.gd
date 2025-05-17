extends Node2D

signal logic_solved(state: bool)

#immaculate
var a = false
var b = false
var c = false
var d = false
var e = false
var f = false

var alrValidated

func validate():
	var abc = not a and (b and c)
	var def = not ( (d or not e)or f) 
	
	
	
	if (a == true):
		$"Node2D/a/AnimatedSprite2D".play("on")
		$"Node2D/na/AnimatedSprite2D".play("off")
	else:
		$"Node2D/a/AnimatedSprite2D".play("off")
		$"Node2D/na/AnimatedSprite2D".play("on")
	if (b == true):
		$"Node2D/b/AnimatedSprite2D".play("on")
	else:
		$"Node2D/b/AnimatedSprite2D".play("off")
	if (c == true):
		$"Node2D/c/AnimatedSprite2D".play("on")
	else:
		$"Node2D/c/AnimatedSprite2D".play("off")
	if (d == true):
		$"Node2D/d/AnimatedSprite2D".play("on")
	else:
		$"Node2D/d/AnimatedSprite2D".play("off")
	if (e == true):
		$"Node2D/e/AnimatedSprite2D".play("on")
		$"Node2D/ne/AnimatedSprite2D".play("off")
	else:
		$"Node2D/e/AnimatedSprite2D".play("off")
		$"Node2D/ne/AnimatedSprite2D".play("on")
	if (f == true):
		$"Node2D/f/AnimatedSprite2D".play("on")
	else:
		$"Node2D/f/AnimatedSprite2D".play("off")
		
		
		
	if (b and c):
		$"Node2D/bc/AnimatedSprite2D".play("on")
	else:
		$"Node2D/bc/AnimatedSprite2D".play("off")
	if (abc):
		$"Node2D/abc/AnimatedSprite2D".play("on")
	else: 
		$"Node2D/abc/AnimatedSprite2D".play("off")
	if (d or not e):
		$"Node2D/de/AnimatedSprite2D".play("on")
	else: 
		$"Node2D/de/AnimatedSprite2D".play("off")
	if ((d or not e) or f):
		$"Node2D/def/AnimatedSprite2D".play("on")
	else: 
		$"Node2D/def/AnimatedSprite2D".play("off")
	if (def):
		$"Node2D/ndef/AnimatedSprite2D".play("on")
	else: 
		$"Node2D/ndef/AnimatedSprite2D".play("off")
	
	if (abc and def):
		$"powersource".play("on")

	#else:
		#$"powersource".play("off")
	return abc and def

# figure out a way to change the thingimabobs how do signals work?


func _ready():
	
	validate()
	pass

func _physics_process(delta: float) -> void:
	if validate() and not alrValidated:
		alrValidated = true
		print("true")
		$"../slidingdoorbot".get_node("AnimatableBody2D").open()
		emit_signal("logic_solved", true)

# does this permanently turn it on? 
func _on_button_a_button_pressed(state: bool) -> void:
	a = state

func _on_button_b_button_pressed(state: bool) -> void:
	b = state

func _on_button_c_button_pressed(state: bool) -> void:
	c = state

func _on_button_d_button_pressed(state: bool) -> void:
	d = state

func _on_button_e_button_pressed(state: bool) -> void:
	e = state

func _on_button_f_button_pressed(state: bool) -> void:
	f = state
