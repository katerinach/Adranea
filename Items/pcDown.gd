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
					timeline_name = "Computer-" + str(dialogic_index)
					var dialog = Dialogic.start(timeline_name)
					dialog.pause_mode = PAUSE_MODE_PROCESS
					get_parent().add_child(dialog)
					dialog.connect("timeline_end", self, "end_dialog")
					get_tree().paused = true
					Global.computer_task = true
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

func end_dialog(timeline_name):
	get_tree().paused = false 
	
