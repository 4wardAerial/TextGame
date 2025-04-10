extends CharacterBody2D

var speed: int = 400
var is_walking: bool = false
var is_running: bool = false

func get_movement()-> void:
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	is_running = false if velocity == Vector2(0, 0) else true 

func get_accel_input()-> void:
	if Input.is_action_just_pressed("shift"):
		is_running = true
		print("RUNNING!")
		speed = 600
	if Input.is_action_just_released("shift"):
		is_running = false
		print("WALKING!")
		speed = 400

func _physics_process(_delta: float):
	get_movement()
	get_accel_input()
	move_and_slide()
