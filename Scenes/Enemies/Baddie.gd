extends CharacterBody2D

var movement_speed := 50.0

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D

func _ready() -> void:
	# These values need to be adjusted for the actor's speed
	# and the navigation layout.
	navigation_agent.path_desired_distance = 5
	navigation_agent.target_desired_distance = 5
	navigation_agent.debug_enabled = true
	var sprite = $AnimatedSprite2D
	sprite.play("default")

func set_movement_target(movement_target: Vector2) -> void:
	navigation_agent.target_position = movement_target
	
func _physics_process(_delta: float) -> void:
	if navigation_agent.is_navigation_finished():
		return

	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()
	
	velocity = current_agent_position.direction_to(next_path_position) * movement_speed
	move_and_slide()
