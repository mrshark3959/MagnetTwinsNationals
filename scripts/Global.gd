extends Node

var speedrun_time = 0.01;
var restarts = 0;

func time_convert(toConv):

	var time_in_sec = int(toConv)
	var seconds = time_in_sec%60
	var minutes = (time_in_sec/60)%60
	#var hours = (time_in_sec/60)/60
	
	var array = str(toConv).split(".")
	var msec = int(array[1].left(2))
	#returns a string with the format "HH:MM:SS"
	return "%02d:%02d.%02d" % [minutes, seconds, msec]
	
