extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var x

# Called when the node enters the scene tree for the first time.
func _ready():
	x = 1
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_left_mouse"):
		x += 1
		match x:
			2:
				get_node("1").visible = false
				get_node("2").visible = true
			3:
				get_node("2").visible = false
				get_node("3").visible = true
			4:
				get_node("3").visible = false
				get_node("4").visible = true
			5:
				get_node("4").visible = false
				get_node("5").visible = true
			6:
				get_node("5").visible = false
				get_node("6").visible = true
			7:
				get_node("6").visible = false
				get_node("7").visible = true
			8:
				get_node("7").visible = false
				get_node("8").visible = true
			9:
				get_tree().change_scene("res://Level Manager.tscn")
				
