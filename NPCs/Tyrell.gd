extends Area2D
onready var _sprite = $Sprite 

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var active = false 
var dialogic_index = 1
var first_frame
var pos
var timeline_name
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self, "_on_NPC_body_entered")
	connect("body_exited", self, "_on_NPC_body_exited")

	
func _process(delta):
	$QuestionMark.visible = active
	if Global.hunter_task == true and Global.telephone_task == true and Global.computer_task == true and Global.boss_task == true and Global.coffee_task == true:
		get_tree().paused = false

func _input(event):
 if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				if active == true:
					if abs(pos.x - self.position.x) <60 and abs(pos.x - self.position.x-10)>20:
						if pos.x >= self.position.x:
							$Sprite.set_frame(0)
						else:
							$Sprite.set_frame(0)
					else:
						if pos.y > (self.position.y):
							$Sprite.set_frame(0)
						else:
							$Sprite.set_frame(0)
					timeline_name = "Tyrell-" + str(dialogic_index)
					var dialog = Dialogic.start(timeline_name)
					dialog.pause_mode = PAUSE_MODE_PROCESS
					get_parent().add_child(dialog)
					dialog.connect("timeline_end", self, "end_dialog")
					get_tree().paused = true
					Global.boss_task = true
					Global.task_parent = self.get_tree()
					if dialogic_index != 2:
						dialogic_index = dialogic_index +1

			
func _on_NPC_body_entered(body):
	if body.name == 'Stede':
		active = true
	pos = body.global_position
	

func _on_NPC_body_exited(body):
	if body.name == 'Stede':
		active = false
	_sprite.set_frame(0)
	
	
func end_dialog(timeline_name):
	get_tree().paused = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
