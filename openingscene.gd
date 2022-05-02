extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timeline_name 

func _ready():
	timeline_name = "opening"
func _process(delta):
	if Global.open_index == 1:
		timeline_name = ("opening")
		var dialog = Dialogic.start(timeline_name)
		dialog.pause_mode = PAUSE_MODE_PROCESS
		get_parent().add_child(dialog)
		dialog.connect("timeline_end", self, "end_dialog")
		Global.open_index = Global.open_index + 1



func end_dialog(timeline_name):
	self.queue_free()
	get_tree().change_scene("res://Day 1//Office1.tscn")


func _on_Area2D_ready():
	var dialog = Dialogic.start(timeline_name)
	dialog.pause_mode = PAUSE_MODE_PROCESS
	get_parent().add_child(dialog)
	dialog.connect("timeline_end", self, "end_dialog")
