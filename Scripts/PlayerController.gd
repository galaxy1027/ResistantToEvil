extends CharacterBody3D

@export var speed = 1.0
@export var jump_velocity = 8.0
@export var turn_speed = 1.0
var jumping = false
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var quick_turning = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jump_velocity
		
	var input_vertical = Input.get_axis("Forward", "Backward")
	var input_horizontal = Input.get_axis("Right", "Left")
	
	translate(Vector3(0, 0, speed * input_vertical) * delta)
	rotate_y(turn_speed * input_horizontal * delta)
	velocity.y -= gravity * delta
	
	move_and_slide()
