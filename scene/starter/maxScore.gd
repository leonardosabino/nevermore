extends Label

onready var main = get_node("/root/main");

func _ready():
	pass 
	
func _process(delta):
	if (main.scoreMax > 0):
		set_text(str(int(main.scoreMax)))
		return;
	
	set_text('')

