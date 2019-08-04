extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng = RandomNumberGenerator.new()
var yarn1  = false
var yarn2  = false
var yarn3  = false
var yarn4  = false
var yarn5  = false
var gamewon
const returnToScreen = 2.0
var seconds_before_return
var audio

# Called when the node enters the scene tree for the first time.
func _ready():
	audio = AudioStreamPlayer.new()
	self.add_child(audio)
	audio.stream = load("res://Sounds/cut.wav")
	seconds_before_return = 0
	rng.randomize()
	var rnum = rng.randi_range(1,10)
	match rnum:
		1:
			yarn1 = true
			yarn2 = true
		2:
			yarn1 = true
			yarn3 = true
		3:
			yarn1 = true
			yarn4 = true
		4:
			yarn1 = true
			yarn5 = true
		5:
			yarn2 = true
			yarn3 = true
		6:
			yarn2 = true
			yarn4 = true
		7:
			yarn2 = true
			yarn5 = true
		8:
			yarn3 = true
			yarn4 = true
		9:
			yarn3 = true
			yarn5 = true
		10:
			yarn4 = true
			yarn5 = true

func _process(delta):	
	if gamewon == true or gamewon == false:
		if(seconds_before_return > returnToScreen):
			if gamewon == true:
				get_tree().get_root().get_node("Level Manager").wins += 1
				get_tree().get_root().get_node("Level Manager").done += 1
			elif gamewon == false:
				get_tree().get_root().get_node("Level Manager").losses += 1
				get_tree().get_root().get_node("Level Manager").done += 1
			var manager = get_tree().get_root().get_node("Level Manager")
			manager.yarn_desk_return()
		else:
			seconds_before_return += delta
	if get_tree().get_root().get_node("Level Manager").time <= 0.2:
		var manager = get_tree().get_root().get_node("Level Manager")
		manager.yarn_desk_return()
