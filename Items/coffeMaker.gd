extends Area2D

var active = false
var dialogic_index = 1
var timeline_name
func _process(delta):
	$QuestionMark.visible = active
	

func _input(event):
 if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				if active == true:
					timeline_name = "Coffee-" + str(dialogic_index)
					var dialog = Dialogic.start(timeline_name)
					dialog.pause_mode = PAUSE_MODE_PROCESS
					get_parent().add_child(dialog)
					dialog.connect("timeline_end", self, "after_dialog")
					get_tree().paused = true
					Global.coffee_task = true
					Global.task_parent = self.get_tree()
					if dialogic_index != 1:
						dialogic_index = dialogic_index +1 
						
func _ready():
	connect("body_entered", self, "_on_NPC_body_entered")
	connect("body_exited", self, "_on_NPC_body_exited")


func _on_NPC_body_entered(body):
	if body.name == 'Stede':
		active = true

	

func _on_NPC_body_exited(body):
	if body.name == 'Stede':
		active = false



func after_dialog(timeline_name):
	get_tree().paused = false
