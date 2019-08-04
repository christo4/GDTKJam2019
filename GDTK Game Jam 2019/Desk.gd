extends Node
var meme
func _ready():
	meme = -1
func _process(delta):
	if meme == 0:
		get_node("BAD").show()
	elif meme == 1:
		get_node("Ok").show()
	elif meme == 2:
		get_node("GREAT").show()
	
	if Input.is_action_just_pressed("ui_left_mouse") and meme >= 0:
		get_tree().quit()
