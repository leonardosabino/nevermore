extends Node2D

var max_dist = 700
var max_dist2 = 892
var max_dist3 = 1084
var down = Vector2(0, 1)
var vel = 150
var vel_plus = 1

enum {GOING, RETURNING}
var status = GOING

onready var init_pos = global_position

var randomNumber = rand_range(0, 10)
var count = 0
var seconds = 1

func _ready():
	pass
	
func _process(delta):
	seconds += delta
	
	if seconds > 15:
		vel_plus += 0.5
		seconds = 0
		pass
	
	if count > 7 && randomNumber < 2:
		randomNumber = rand_range(0, 10)
	pass
	if randomNumber > 2:
		if status == GOING:
			translate(down * vel * delta * vel_plus)
			if init_pos.y == -256:
				if global_position.distance_to(init_pos) > max_dist2:
					status = RETURNING
				pass
			elif init_pos.y == -448:
				if global_position.distance_to(init_pos) > max_dist3:
					status = RETURNING
				pass
			else:
				if global_position.distance_to(init_pos) > max_dist:
					status = RETURNING
				pass
		pass
		if status == RETURNING:
			set_position(init_pos)
			randomNumber = rand_range(0, 10)
			status = GOING
			count = 0
		pass
	else:
		count += delta
	pass

