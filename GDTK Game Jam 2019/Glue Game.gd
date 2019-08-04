extends Area2D

var entered
var camera
var zoom_in
var zoom_out
var zoom_val
var zoom_inc
var completed
var gamewon

func _ready():
	entered = false
	zoom_in = false
	zoom_out = false
	completed = false
	zoom_val = 1.00
	zoom_inc = 0.01
	camera = get_parent().get_node("Game Camera")

func _process(delta):
	if Input.is_action_just_pressed("ui_left_mouse") and entered and not completed:
		camera.position = position
		zoom_in = true
	if zoom_in:
		camera.zoom = Vector2(zoom_val, zoom_val)
		zoom_val -= zoom_inc
		if zoom_val < 0.10:
			zoom_in = false
			zoom_out = true
			completed = true
			var manager = get_tree().get_root().get_node("Level Manager")
			manager.load_minigame("res://GlueGame.tscn")
	if zoom_out:
		if gamewon == true:
			get_node("Checkmark").show()
		elif gamewon == false:
			get_node("Redex").show()
		camera.zoom = Vector2(zoom_val, zoom_val)
		zoom_val += zoom_inc
		camera.position = Vector2(960, 540)
		if zoom_val > 1.00:
			zoom_out = false

func _on_Glue_Game_mouse_entered():
	entered = true

func _on_Glue_Game_mouse_exited():
	entered = false