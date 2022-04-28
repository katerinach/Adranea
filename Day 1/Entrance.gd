extends Area2D



func _on_Office1_body_entered(body):
	if body.name =='Stede':
		Global.from_scene = get_parent().name
		get_tree().change_scene('res://Day 1/' + self.name + '.tscn')
		


func _on_World_body_entered(body):
	if body.name =='Stede':
		Global.from_scene = get_parent().name
		get_tree().change_scene('res://Day 1/' + self.name + '.tscn')



func _on_Corridor_body_entered(body):
	if body.name =='Stede':
		Global.from_scene = get_parent().name
		get_tree().change_scene('res://Day 1/' + self.name + '.tscn')


func _on_BossOffice_body_entered(body):
	if body.name == 'Stede':
		Global.from_scene = get_parent().name
		get_tree().change_scene('res://Day 1/' + self.name + '.tscn')


func _on_MensToilet_body_entered(body):
	if body.name == 'Stede':
		Global.from_scene = get_parent().name
		get_tree().change_scene('res://Day 1/' + self.name + '.tscn')
