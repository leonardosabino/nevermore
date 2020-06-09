extends Label
onready var main = get_node("/root/main");
var score = 0

func _ready():
	score = main.score
	pass 

func _process(delta):
	if (score < 10):
		set_text("Am i a joke to you?")
		
	if (score >= 10 && score < 50):
		set_text("You shame me")
		
	if (score >= 50 && score < 100):
		set_text("I've seen better")
		
	if (score >= 100 && score < 150):
		set_text("Not so bad")
		
	if (score > 200):
		set_text("NEVERMORE!")
	
	pass
