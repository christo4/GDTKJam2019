extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var entered

# Called when the node enters the scene tree for the first time.
func _ready():
	entered = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_left_mouse") and entered and get_parent().yarn4 == true:
		print("win")
	if Input.is_action_just_pressed("ui_left_mouse") and entered and get_parent().yarn4 != true:
		print("lose")


func _on_PurpleYarn_mouse_entered():
	entered = true


func _on_PurpleYarn_mouse_exited():
	entered = false
