extends Node2D

func _ready():
	if OS.get_name() != "Android":
		queue_free()
	pass
