extends Area2D

var entered
var marker
var audio

func _ready():
	audio = AudioStreamPlayer.new()
	self.add_child(audio)
	audio.stream = load("res://Sounds/shake.wav")
	entered = false
	marker = get_parent().get_node("Marker")

func _process(delta):
	if get_tree().get_root().get_node("Level Manager").time <= 0.2:
		var manager = get_tree().get_root().get_node("Level Manager")
		manager.desk_return()
	
	if Input.is_action_just_pressed("ui_left_mouse") and entered:
		audio.play()
		if marker.position.x < 1472:
			marker.position.x += 32
	elif Input.is_action_pressed("ui_left_mouse") and entered:
		$Sprite.play("Pressed")
	else:
		$Sprite.play("Idle")
	if marker.position.x > 448 and marker.position.x < 960:
		marker.position.x -= 1
	elif marker.position.x >= 960 and marker.position.x < 1216:
		marker.position.x -= 2
	elif marker.position.x >= 1216 and marker.position.x < 1472:
		marker.position.x -= 3
	elif marker.position.x >= 1472:
		get_tree().get_root().get_node("Level Manager").done += 1
		get_tree().get_root().get_node("Level Manager").wins += 1
		var manager = get_tree().get_root().get_node("Level Manager")
		manager.desk_return()

func _on_Mash_Button_mouse_entered():
	entered = true

func _on_Mash_Button_mouse_exited():
	entered = false