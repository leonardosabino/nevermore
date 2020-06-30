extends Node2D

onready var main = get_node("/root/main");

var max_dist = 700
var down = Vector2(0, 1)
var vel = 150

onready var init_pos = global_position

var rot = 0
var velPlus = 1

func _ready():
	randomize()
	rot = rand_range(-10, 10)
	pass
	
func _process(delta):
	if (rot > 0):
		rotate(3 * delta)
	else:
		rotate(-3 * delta)
	pass
	
	velPlus = 1 + ((int(main.score) / 15) * 0.3)
	
	translate(down * vel * delta * velPlus)
	
	if global_position.distance_to(init_pos) > max_dist:
		queue_free()
		pass

	pass


