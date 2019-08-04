extends Area2D

var entered

# Called when the node enters the scene tree for the first time.
func _ready():
	entered = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent().gamewon != true and get_parent().gamewon != false:
		if Input.is_action_just_pressed("ui_left_mouse") and entered and get_parent().yarn3 == true:
			get_parent().gamewon = true
			$Sprite.play("cut")
		if Input.is_action_just_pressed("ui_left_mouse") and entered and get_parent().yarn3 != true:
			get_parent().gamewon = false
			$Sprite.play("cut")

func _on_YellowYarn_mouse_entered():
	entered = true


func _on_YellowYarn_mouse_exited():
	entered = false
