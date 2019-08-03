extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var entered
var marker
var moveRight

# Called when the node enters the scene tree for the first time.
func _ready():
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
		marker.position.x +=10
	else:
		marker.position.x -=10
	if Input.is_action_just_pressed("ui_left_mouse") and entered:
		if marker.position.x < 1010 and marker.position.x > 910:
			get_tree().quit()


func _on_Glue_mouse_entered():
	entered = true


func _on_Glue_mouse_exited():
	entered = false
