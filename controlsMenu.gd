extends Control




func _on_quitButton_pressed():
	get_tree().quit()


func _on_backButton_pressed():
	queue_free()
