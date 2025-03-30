extends CanvasLayer

var time = Global.speedrun_time 

func time_convert(toConv):

	var time_in_sec = int(toConv)
	var seconds = time_in_sec%60
	var minutes = (time_in_sec/60)%60
	#var hours = (time_in_sec/60)/60
	
	var array = str(toConv).split(".")
	var msec = int(array[1].left(2))
	#returns a string with the format "HH:MM:SS"
	return "%02d:%02d.%02d" % [minutes, seconds, msec]
	
 
func _physics_process(delta):
	time = float(time) + delta
	update_ui()
	
func update_ui():
	# Format time with two decimal places
	var formatted_time = str(time)
	var decimal_index = formatted_time.find(".")
	
	if decimal_index > 0:
		formatted_time = formatted_time.left(decimal_index + 3)  # Take only two decimal places
	
	Global.speedrun_time = formatted_time
		
	$Label.text = time_convert(formatted_time)
