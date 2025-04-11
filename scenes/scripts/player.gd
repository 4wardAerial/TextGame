extends CharacterBody2D

var speed: int = 400
var is_walking: bool = false
var is_running: bool = false

func get_movement_input() -> void:
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	# Sets it to true if moving, false if not
	is_walking = false if velocity == Vector2(0, 0) else true

func get_accel_input() -> void:
	if Input.is_action_just_pressed("shift"):
		is_running = true
		speed =700
	if Input.is_action_just_released("shift"):
		is_running = false
		speed = 400

func _input(space: InputEvent) -> void:
	if (space.is_action_pressed("space")):
		print("ACTION!")

func _process(_delta: float) -> void:
	get_movement_input()
	get_accel_input()
	move_and_slide()
