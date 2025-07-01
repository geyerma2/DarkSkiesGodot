extends Node

func _on_spawn_delay_timeout():
		spawn_new_enemy()
		$SpawnDelay.start()
		
func spawn_new_enemy():
	var enemyScene := preload("res://Scenes/Enemies/Baddie.tscn")
	var enemy = enemyScene.instantiate()
	
	var mob_spawn_location = $BaddieSpawnLocation
	mob_spawn_location.progress_ratio = randf()
	# Set the mob's position to the random location.
	enemy.position = mob_spawn_location.position
	
	var baddieGoal = $Target
	
	enemy.set_movement_target(baddieGoal.global_position)
	
	add_child(enemy)
