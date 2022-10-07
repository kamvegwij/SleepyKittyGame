extends KinematicBody2D

export (int) var speed = 90
#onready var particlePos = $Position2D
#var particles = preload("res://scenes/Particles2D.tscn")

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("right"):
		velocity.x += 2
		
#		var particleInstance = particles.instance()
#		particleInstance.set_position(particlePos.get_position())
#		particleInstance.set_emitting(true)
#		add_child(particleInstance)

	if Input.is_action_pressed("left"):
		velocity.x -= 2
	if Input.is_action_pressed("jump"):
		pass #make character jump
	
		#below defines how to link animations for smooth transitions.
	if velocity == Vector2.ZERO:
		$AnimationTree.get("parameters/playback").travel("Idle")

	else:
		$AnimationTree.get("parameters/playback").travel("CatMove")
		$AnimationTree.set("parameters/Idle/blend_position", velocity)
		$AnimationTree.set("parameters/CatMove/blend_position", velocity)
	move_and_slide(velocity * speed)
