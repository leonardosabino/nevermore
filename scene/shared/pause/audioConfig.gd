extends HSlider

func _ready():
	self.connect("value_changed", self, "on_change")
	set_ticks(10)
	set_ticks_on_borders(true)
	value = get_node("/root/main").volume
	pass

func on_change(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
	get_node("/root/main").setVolume(value)
	pass
