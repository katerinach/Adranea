extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var active = false 
var dialogic_index = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self, "_on_NPC_body_entered")
	connect("body_exited", self, "_on_NPC_body_exited")
	
func _process(delta):
	$QuestionMark.visible = active

func _input(event):
 if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT:
			if event.pressed:
				if active == true:
					var dialog = Dialogic.start("hunter-" + str(dialogic_index))
					dialog.pause_mode = PAUSE_MODE_PROCESS
					get_parent().add_child(dialog)
					dialog.connect("timeline_end", self, "end_dialog")
					get_tree().paused = true
					get_tree().paused = false 
					dialogic_index = dialogic_index +1

			
func _on_NPC_body_entered(body):
	if body.name == 'Player':
		active = true
	

func _on_NPC_body_exited(body):
	if body.name == 'Player':
		active = false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
