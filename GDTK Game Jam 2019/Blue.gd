extends Area2D

var entered
var mouse_offset
var mouse_position
var mouse_position_old
var dragged
var overlap
var top_dog

func _ready():
	entered = false
	dragged = false
	mouse_offset = Vector2()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	top_dog = true
	overlap = get_overlapping_areas()
	for x in overlap:
		if x.z_index > z_index and x.get("entered"):
			top_dog = false
			break
	if top_dog:
		if Input.is_action_pressed("ui_left_mouse") and entered and not dragged:
			mouse_position_old = get_viewport().get_mouse_position() #sets the old mouse pos to an initial value upon clicking the box
			dragged = true
			get_parent().get_node("wallpaper").audio.play()
		elif Input.is_action_pressed("ui_left_mouse") and entered and dragged:
			mouse_position = get_viewport().get_mouse_position()
			mouse_offset = mouse_position - mouse_position_old
			mouse_position_old = mouse_position
			set_position(position + mouse_offset)
		else:
			dragged = false

func _on_Blue_mouse_entered():
	entered = true

func _on_Blue_mouse_exited():
	entered = false
