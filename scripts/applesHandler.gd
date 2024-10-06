extends Node2D

# stores apples count score
#var appleCount = 0

#@export var lableTxt : Label

var spawns = 0

# preload apple scene
var red_apple_instance = preload("res://scenes/red_apple.tscn")
var yellow_apple_instance = preload("res://scenes/yellow_apple.tscn")
var green_apple_instance = preload("res://scenes/green_apple.tscn")

#var appleScore = preload($appleScore)

#screen vars 
var screenSize = 0
var screen_hight = 100
var screen_width = 100

# generate new random num
var random = RandomNumberGenerator.new()

# number of apples spawned at once
var spawnNum = 30

# get apple score node
#var scoreTxt = 0

var label = 0

var scene_red_apple = 0
var scene_yellow_apple = 0
var scene_green_apple = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	scene_red_apple = preload("res://scenes/red_apple.tscn").instantiate()
	add_child(scene_red_apple)
	
	scene_yellow_apple = preload("res://scenes/yellow_apple.tscn").instantiate()
	add_child(scene_yellow_apple)
	
	scene_green_apple = preload("res://scenes/green_apple.tscn").instantiate()
	add_child(scene_green_apple)
	
	#scene_apple.connect("applePressed", Callable(self, "test"))
	
	#get screen size
	screenSize = get_viewport().get_visible_rect().size
	screen_hight = screenSize.x
	screen_width = screenSize.y
	#print("width: " , screenSize.x , " , hight: " , screenSize.y)
	
	#var appleNode = get_node("res://scripts/apple_button.gd")
	#print(appleNode)
	#$appleScoreLable.text = "kill me"
	#print(Spremenljivke.current_scene)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(Spremenljivke.current_scene)
	#if Spremenljivke.current_scene == "sortiranje":
	#	print("appppppellllllllllllllllllllllllll")
	#	spawn()
	#	Spremenljivke.transition_scene = false
	if Input.is_action_pressed("ui_cancel"):
		Spremenljivke.switchback()
	
	if Spremenljivke.spawnApple == true and spawns == 0:
		spawn()
		spawns += 1
		Spremenljivke.spawnApple == true
	
	#print(appleCount)
	
func spawn():
	for i in spawnNum:
		var obj = red_apple_instance.instantiate()
		#print(obj)
		obj.position = get_random_pos()
		#add obj to scene
		add_child(obj)
	for j in spawnNum:
		var obj = yellow_apple_instance.instantiate()
		obj.position = get_random_pos()
		add_child(obj)
	for k in spawnNum:
		var obj = green_apple_instance.instantiate()
		obj.position = get_random_pos()
		add_child(obj)
	
func delete(deleteThis, thisName):
	#updateScore()
	#print("deleteee this bish")
	if thisName == "redButton" or thisName == "greenButton":
		GameManager.apple_score -= 1
	elif thisName == "yellowButton":
		GameManager.apple_score += 1
	deleteThis.queue_free()
	
func get_random_pos():
	random.randomize()
	var x = random.randf_range(0, screen_hight-30)
	var y = random.randf_range(0, screen_width-30)
	#print("random", x,y)
	return Vector2(x,y)
	
func updateScore():
	pass
	#print(appleCount)
	#label.text = "Score: " + str(appleCount)
	#var label = get_node("Label")
	#label = get_node("appleScoreLable")
	#if label != null:
	#	print("found")
	#	label.text = "Score: " + str(appleCount)
	#else:
	#	print("Label node not found!")
	
	
