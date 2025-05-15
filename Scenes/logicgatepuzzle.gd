extends Node2D

#immaculate
var a = false
var b = false
var c = false
var d = false
var e = false
var f = false
var g = false
var h = false

func validate():
	var validation = false
	var r1 = not (a or b)
	var r2 = not c and (d and e)
	var r3 = not((f or not g) or h)
	var r23 = not(r2 and r3)
	validation = not(r1 or r23)
	return validation

# figure out a way to change the thingimabobs how do signals work?


func _ready():
	#validate()
	pass

func _physics_process(delta: float) -> void:
	if validate():
		print("true")

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

func _on_button_g_button_pressed(state: bool) -> void:
	g = state

func _on_button_h_button_pressed(state: bool) -> void:
	h = state
