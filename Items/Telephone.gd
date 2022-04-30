extends Area2D

var active = false
var dialogic_index = 1

func _process(delta):
	$QuestionMark.visible = active
	

func _input(event):
 if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT:
			if event.pressed:
				if active == true:
					if dialogic_index == 1:
						var dialog = Dialogic.start("Telephone-" + str(dialogic_index))
						dialog.pause_mode = PAUSE_MODE_PROCESS
						get_parent().add_child(dialog)
						dialog.connect("timeline_end", self, "end_dialog")
						get_tree().paused = true
						get_tree().paused = false
						Global.telephone_task = true
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

	
