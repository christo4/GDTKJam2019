extends Area2D

var entered
var overlap
var top_dog

func _ready():
	entered = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	top_dog = true
	overlap = get_overlapping_areas()
	for x in overlap:
		if x.z_index > z_index and x.get("entered"):
			top_dog = false
			break
		else:
			top_dog = true
	if top_dog:
		if Input.is_action_pressed("ui_left_mouse") and entered:
			print("YOU WIN!")
			get_tree().quit()

func _on_WIN_mouse_entered():
	entered = true

func _on_WIN_mouse_exited():
	entered = false
