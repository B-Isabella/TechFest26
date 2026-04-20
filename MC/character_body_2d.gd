extends CharacterBody2D

@export var speed = 400
@onready var animated_sprite = $AnimatedSprite2D

var last_dir = "down"

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	if velocity.length() > 0:
		#updates flip
		if velocity.x != 0:
			animated_sprite.flip_h = velocity.x < 0
			last_dir = "side"
		elif velocity.y != 0:
			last_dir = "down" if velocity.y > 0 else "up"
		animated_sprite.play("walking " + last_dir)
	else:
		animated_sprite.play("idle " + last_dir)

func _physics_process(delta):
	get_input()
	move_and_slide()
