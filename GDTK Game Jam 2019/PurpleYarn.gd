extends Area2D

var entered

# Called when the node enters the scene tree for the first time.
func _ready():
	entered = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_left_mouse") and entered and get_parent().yarn4 == true:
		get_parent().gamewon = true
	if Input.is_action_just_pressed("ui_left_mouse") and entered and get_parent().yarn4 != true:
		get_parent().gamewon = false


func _on_PurpleYarn_mouse_entered():
	entered = true


func _on_PurpleYarn_mouse_exited():
	entered = false
