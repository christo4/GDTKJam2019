extends Area2D

var entered
var camera
var zooming
var zoom_val
var zoom_inc

func _ready():
	entered = false
	zooming = false
	zoom_val = 1.00
	zoom_inc = 0.01
	camera = get_parent().get_node("Game Camera")

func _process(delta):
	if Input.is_action_just_pressed("ui_left_mouse") and entered:
		camera.position = Vector2(246, 241)
		zooming = true
	if zooming:
		camera.zoom = Vector2(zoom_val, zoom_val)
		zoom_val -= zoom_inc
		if zoom_val < 0.20:
			zooming = false
			zoom_val = 1.00
			

func _on_Button_Mash_Game_mouse_entered():
	entered = true

func _on_Button_Mash_Game_mouse_exited():
	entered = false
