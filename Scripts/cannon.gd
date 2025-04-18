extends Node2D
@export var bulletangle = 20
@export var bulletspeed = 8
@export var gravity = 5
@export var directionalforce = Vector2()

@export var bullet_scene: PackedScene
@onready var cannonspawn =$cannonspawn

	
func setbulletangle(value):
	bulletangle = clamp(value,0,359)

func updatedirectionalforce():
	directionalforce = Vector2(cos(bulletangle*(PI/180)),sin(bulletangle*(PI/180)))


func _on_ready() -> void:
	updatedirectionalforce()
	
	set_process_input(true)
	
	set_process(true)

func shoot():
	var bullet = bullet_scene.instance()
	bullet.set_global_pos(cannonspawn.get_global_pos())
	bullet.shoot(directionalforce,gravity)
	get_parent().add_child(cannonspawn)
