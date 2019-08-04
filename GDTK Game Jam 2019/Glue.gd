extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var entered
var marker
var moveRight
var gamewon
var exitGame
const returnToScreen = 2.0
var seconds_before_return
var audio

# Called when the node enters the scene tree for the first time.
func _ready():
	audio = AudioStreamPlayer.new()
	self.add_child(audio)
	audio.stream = load("res://Sounds/splat.wav")
	seconds_before_return = 0
	exitGame = false
	entered = false
	marker = get_parent().get_node("RedButton")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#448 1472
	if marker.position.x <= 448:
		moveRight = true
	elif marker.position.x >= 1472:
		moveRight = false
	if moveRight:
		marker.position.x +=20
	else:
		marker.position.x -=20
	if Input.is_action_just_pressed("ui_left_mouse") and entered:
		get_parent().get_node("Gluesplat").show()
		audio.play()
		exitGame = true
		if marker.position.x < 1024 and marker.position.x > 896:
			gamewon = true
			get_tree().get_root().get_node("Level Manager").wins += 1
			get_tree().get_root().get_node("Level Manager").done += 1
		else:
			gamewon = false
			get_tree().get_root().get_node("Level Manager").losses += 1
			get_tree().get_root().get_node("Level Manager").done += 1
	
	if(seconds_before_return > returnToScreen) and (gamewon == true or gamewon == false):
		var manager = get_tree().get_root().get_node("Level Manager")
		manager.glue_desk_return()
	else:
		seconds_before_return += delta
		
	if get_tree().get_root().get_node("Level Manager").time <= 0.2:
		var manager = get_tree().get_root().get_node("Level Manager")
		manager.glue_desk_return()

func _on_Glue_mouse_entered():
	entered = true


func _on_Glue_mouse_exited():
	entered = false
