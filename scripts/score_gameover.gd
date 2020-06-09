extends Label
onready var main = get_node("/root/main");

func _ready():
	set_text("Time:" + str(int(main.score)))
	pass

func _process(delta):
	pass
