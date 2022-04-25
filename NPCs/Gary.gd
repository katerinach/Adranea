extends Area2D
onready var _sprite = $Sprite 

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var active = false 
var dialogic_index = 1
var first_frame
var pos
var pos_temp
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self, "_on_NPC_body_entered")
	connect("body_exited", self, "_on_NPC_body_exited")
	var first_frame = int(_sprite.get_frame())
	
func _process(delta):
	$QuestionMark.visible = active

func _input(event):
 if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT:
			if event.pressed:
				if active == true:
					pos_temp = int(pos.x) - 20
					if abs(pos_temp - self.position.x) <60 and abs(pos_temp - self.position.x-10)>20:
						if pos_temp < self.position.x:
							$Sprite.set_frame(2)
						else:
							$Sprite.set_frame(1)
					else:
						if pos.y > (self.position.y):
							$Sprite.set_frame(0)
						else:
							$Sprite.set_frame(3)
					
						
					var dialog = Dialogic.start("Gary-" + str(dialogic_index))
					dialog.pause_mode = PAUSE_MODE_PROCESS
					get_parent().add_child(dialog)
					dialog.connect("timeline_end", self, "end_dialog")
					get_tree().paused = true
					get_tree().paused = false
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
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
