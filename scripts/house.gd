extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	change_scene()

func _on_exit_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		HiskaGlobal.transition_scene = true

func _on_exit_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
	
func change_scene():
	if HiskaGlobal.transition_scene == true:
		if HiskaGlobal.current_scene == "house":
			get_tree().change_scene_to_file("res://scenes/world.tscn")
			HiskaGlobal.finish_changescenes()
