extends Node

var desk_save
var time
var done
var wins
var losses
var meme

func _ready():
	time = 60.0
	done = 0
	wins = 0
	losses = 0
	var start = load("res://Desk.tscn").instance()
	get_tree().get_root().call_deferred("add_child", start)
	get_tree().call_deferred("set_current_scene", start)

func load_minigame(minigame):
	desk_save = get_tree().get_current_scene()
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

func yarn_desk_return():
	if desk_save != null:
		var status = get_tree().get_current_scene().gamewon
		get_tree().get_current_scene().queue_free()
		desk_save.get_node("Yarn Game").gamewon = status
		get_tree().get_root().add_child(desk_save)
		get_tree().set_current_scene(desk_save)
		desk_save = null

func glue_desk_return():
	if desk_save != null:
		var status = get_tree().get_current_scene().get_node("Glue").gamewon
		get_tree().get_current_scene().queue_free()
		desk_save.get_node("Glue Game").gamewon = status
		get_tree().get_root().add_child(desk_save)
		get_tree().set_current_scene(desk_save)
		desk_save = null

func scissor_desk_return():
	if desk_save != null:
		var status = get_tree().get_current_scene().gamewon
		get_tree().get_current_scene().queue_free()
		desk_save.get_node("Scissor Game").gamewon = status
		get_tree().get_root().add_child(desk_save)
		get_tree().set_current_scene(desk_save)
		desk_save = null

func _process(delta):
	if done == 5 or time < 0.2:
		if wins <= 2:
			get_tree().get_root().get_node("Desk").meme = 0
		elif wins == 3 or wins == 4:
			get_tree().get_root().get_node("Desk").meme = 1
		elif wins == 5:
			get_tree().get_root().get_node("Desk").meme = 2
		
	else:
		time -= delta