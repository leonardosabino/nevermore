extends Label
onready var main = get_node("/root/main");

func _ready():
	main.connect("score_changed", self, "on_score_changed")
	pass

func _process(delta):
	pass
	
func on_score_changed():
	set_text("Time: " + str(int(main.score)))
	pass
