extends Area2D

var entered
var overlap
var top_dog
var rng = RandomNumberGenerator.new()

func _ready():
	entered = false
	rng.randomize()
	var posX = rng.randi_range(300,1620)
	var posY = rng.randi_range(100,980)
	position = Vector2(posX,posY)

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
			get_tree().get_root().get_node("Level Manager").done += 1
			get_tree().get_root().get_node("Level Manager").wins += 1
			var manager = get_tree().get_root().get_node("Level Manager")
			manager.desk_return()
			
	if get_tree().get_root().get_node("Level Manager").time <= 0.2:
		var manager = get_tree().get_root().get_node("Level Manager")
		manager.desk_return()

func _on_WIN_mouse_entered():
	entered = true

func _on_WIN_mouse_exited():
	entered = false
