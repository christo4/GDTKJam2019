extends Node

var desk_save

func _ready():
	var start = load("res://Desk.tscn").instance()
	get_tree().get_root().call_deferred("add_child", start)
	get_tree().call_deferred("set_current_scene", start)

func load_minigame(minigame):
	desk_save = get_tree().get_current_scene()
	print(get_tree().get_current_scene())
	get_tree().get_root().remove_child(desk_save)
	var goto = load(minigame).instance()
	get_tree().get_root().add_child(goto)
	get_tree().set_current_scene(goto)

func desk_return():
	if desk_save != null:
		get_tree().get_current_scene().queue_free()
		get_tree().get_root().add_child(desk_save)
		get_tree().set_current_scene(desk_save)
		desk_save = null