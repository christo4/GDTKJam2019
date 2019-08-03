extends Area2D

var entered

func _ready():
	entered = false

func _process(delta):
	if Input.is_action_just_pressed("ui_left_mouse") and entered:
		print("You clicked it!")
	$Sprite.play("Idle")

func _on_Mash_Button_mouse_entered():
	entered = true

func _on_Mash_Button_mouse_exited():
	entered = false