extends RichTextLabel



# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var t = Texture.new()
var t_done = Texture.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	t=load("res://UI/empty-square-icon-png-1-Transparent-Images.png")
	t_done = load("res://UI/tick.png")
	self.add_image(t,10,10)
	add_text(" Introduce yourself to boss\n\n")
	if Global.hunter_task== true: 
		self.add_image(t_done,10,10) 
	else: 
		self.add_image(t,10,10)
	add_text(" Talk to manager Hunter about our customer reviews\n\n")
	if Global.telephone_task== true: 
		self.add_image(t_done,10,10) 
	else: 
		self.add_image(t,10,10)
	add_text(" Sales call to Funkin Fonuts\n\n")
	if Global.computer_task== true: 
		self.add_image(t_done,10,10) 
	else: 
		self.add_image(t,10,10)
	add_text(" Inspect company data analytics\n\n")
	self.add_image(t,10,10)
	add_text(" Have a coffee break")
	request_ready()


func _process(delta):
	self.clear()
	t=load("res://UI/empty-square-icon-png-1-Transparent-Images.png")
	t_done = load("res://UI/tick.png")
	if Global.boss_task == true: 
		self.add_image(t_done,10,10) 
	else: 
		self.add_image(t,10,10)
	add_text(" Introduce yourself to boss\n\n")
	if Global.hunter_task == true: 
		self.add_image(t_done,10,10) 
	else: 
		self.add_image(t,10,10)
	add_text(" Talk to manager Hunter about our customer reviews\n\n")
	if Global.telephone_task== true: 
		self.add_image(t_done,10,10) 
	else: 
		self.add_image(t,10,10)
	add_text(" Sales call to Funkin Fonuts\n\n")
	if Global.computer_task== true: 
		self.add_image(t_done,10,10) 
	else: 
		self.add_image(t,10,10)
	add_text(" Inspect company data analytics\n\n")
	self.add_image(t,10,10)
	add_text(" Have a coffee break")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Window_about_to_show():
	pass # Replace with function body.
