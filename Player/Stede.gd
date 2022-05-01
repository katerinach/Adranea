extends KinematicBody2D


const MAX_SPEED = 80
const ACCELERATION = 500
const FRICTION = 500

var velocity = Vector2.ZERO
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")


func _physics_process(delta):
	#MOVEMENT
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("press_d") - Input.get_action_strength("press_a")
	input_vector.y = Input.get_action_strength("press_s") - Input.get_action_strength("press_w")
	input_vector = input_vector.normalized()
	#CHARACTER ANIMATION TURNING IN CORRECT DIRECTIONS
	
	if input_vector != Vector2.ZERO: #MOVING
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else: #IDLE
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity) #FRICTION AND SLIDING TO MOVEMENT
	if Input.is_action_just_pressed("escape"):
		var settingsmenu = preload("res://Options.tscn").instance()
		get_node("../..").add_child(settingsmenu)


func _on_ToolButton_pressed():
	pass # Replace with function body.


