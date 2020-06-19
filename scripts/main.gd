extends Node2D
	
var score = 0 setget setScore
signal score_changed

func _process(delta):
	if has_node("/root/main/game"): 
		setScore(score + delta)
		pass
	pass
	
func setScore(value):
	emit_signal("score_changed")
	score = value
	pass
