extends CharacterBody2D

const speed = 100
var current_dir = "none"

func _ready():
	#print("sortiranjeee?????")
	$AnimatedSprite2D.play("front_idle")

func _physics_process(delta):
	player_movement(delta)
	current_camera()
	
func player():
	pass
	
func player_movement(delta):
	
	velocity = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		#current_dir = "right"
		#play_anim(1)
		velocity.x += 1
		#velocity.y = 0
	if Input.is_action_pressed("ui_left"):
		#current_dir = "left"
		#play_anim(1)
		velocity.x -= 1
		#velocity.y = 0
	if Input.is_action_pressed("ui_down"):
		#current_dir = "down"
		#play_anim(1)
		#velocity.x = 0
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		#current_dir = "up"
		#play_anim(1)
		#velocity.x = 0
		velocity.y -= 1
	#print(velocity)
	if velocity == Vector2(1,0) or velocity == Vector2(1,1) or velocity == Vector2(1, -1):
		current_dir = "right"
	if velocity == Vector2(-1,0) or velocity == Vector2(-1,1) or velocity == Vector2(-1, -1):
		current_dir = "left"
	if velocity == Vector2(0,1):
		current_dir = "down"
	if velocity == Vector2(0,-1):
		current_dir = "up"
		
	if velocity == Vector2(0,0):
		play_anim(0)
	else:
		play_anim(1)
	#if (velocity.x == 1 and velocity.y == 0) or (velocity.x == 1 and velocity.y == 1):
		
	#if velocity == Vector2(1,1):
		#print("1,1 velocity")
		
	# updates position depending on velocity
	velocity = velocity.normalized() * speed
	#position += velocity * delta
	move_and_slide()
	
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			anim.play("side_idle")
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			anim.play("side_idle")
	if dir == "up":
		if movement == 1:
			anim.play("back_walk")
		elif movement == 0:
			anim.play("back_idle")
	if dir == "down":
		if movement == 1:
			anim.play("front_walk")
		elif movement == 0:
			anim.play("front_idle")


func _on_cliff_body_entered(body: Node2D) -> void:
	pass # Replace with function body.

func current_camera():
	if HiskaGlobal.current_scene == "world":
		$world_camera.enabled = true
		$house_camera.enabled = false
	elif HiskaGlobal.current_scene == "house":
		$world_camera.enabled = false
		$house_camera.enabled = true
