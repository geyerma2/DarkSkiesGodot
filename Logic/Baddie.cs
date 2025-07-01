using Godot;
using System;

public partial class Baddie : CharacterBody2D
{
	private const int MoveSpeed = 20;

	public override void _Ready()
	{
		var navigation_agent = $NavigationAgent2D;
		navigation_agent.path_desired_distance = 5;
		navigation_agent.target_desired_distance = 5;
		navigation_agent.debug_enabled = true;
		var sprite = $AnimatedSprite2D;
		sprite.play("default");
	}
	
	public void set_movement_target(Vector2 movement_target)
	{
		var navigation_agent = $NavigationAgent2D;
		navigation_agent.target_position = movement_target;
	}
	
	public override void _physics_process(float _delta)
	{
		var navigation_agent = $NavigationAgent2D;

		var current_agent_position: Vector2 = global_position;
		var next_path_position: Vector2 = navigation_agent.get_next_path_position();
		
		velocity = current_agent_position.direction_to(next_path_position) * movement_speed;
		move_and_slide();
	}
}
