extends StaticBody2D

@onready var timer = $"../Timer"
var time = 1
func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	if body.name == "Magnus":
		set_process(true)
		timer.start(0.4)

func _on_ready() -> void:
	set_process(false)

func _process(delta: float) -> void:
	time += 1
	$".".position += Vector2(0, sin(time) * 2)


func _on_timer_timeout() -> void:
	queue_free()
