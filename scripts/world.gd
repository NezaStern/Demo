extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_scene()
	gointo_house()

func _on_cliff_body_entered(body):
	print("on cliff body enterd pred ifom", body)
	if body.has_method("player"):
		Spremenljivke.transition_scene = true
		print("okej a dela?")

func _on_cliff_body_exited(body):
	if body.has_method("player"):
		Spremenljivke.transition_scene = false
	
func change_scene():
	if Spremenljivke.transition_scene == true:
		if Spremenljivke.current_scene == "world":
			print("laods appleeee")
			print(Spremenljivke.transition_scene)
			get_tree().change_scene_to_file("res://scenes/sortiranje.tscn")
			Spremenljivke.spawnApple = true
			#Spremenljivke.transition_scene = true
			Spremenljivke.finish_changescenes()
			#Spremenljivke.transition_scene = false

func _on_vratahise_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		HiskaGlobal.transition_scene = true

func _on_vratahise_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
	
func gointo_house():
	if HiskaGlobal.transition_scene == true:
		if HiskaGlobal.current_scene == "world":
			get_tree().change_scene_to_file("res://scenes/house.tscn")
			HiskaGlobal.finish_changescenes()
