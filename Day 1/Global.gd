extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var from_scene = null
var hunter_task
var telephone_task
var computer_task 
var susan_index = 1
var boss_task 
var coffee_task
var open_index = 1
var task_parent
# Called when the node enters the scene tree for the first time.
func _ready():
	hunter_task = false
	telephone_task = false
	computer_task = false
	boss_task = false
	coffee_task = false
func _process(delta):
	if hunter_task == true and telephone_task == true and computer_task == true and boss_task == true and coffee_task == true:
		task_parent.paused = false
		hunter_task = false
		get_tree().change_scene("res://GodotCredits.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
