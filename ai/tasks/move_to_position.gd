extends BTAction


@export var position_var: StringName = &"pos"
@export var direction_var: StringName = &"dir"
@export var tolerance = 40

func _tick(_delta: float) -> Status:
	
	var agent_commands: Array
	if !agent.is_in_group("NPC"): return SUCCESS
	
	var target_pos: Vector2 = blackboard.get_var(position_var, Vector2.ZERO)
	var target_dir: Vector2 = blackboard.get_var(direction_var, Vector2.ZERO)
	var agent_pos: Vector2 = agent.global_position
	var vector = agent_pos - target_pos
	
	if  vector.length() > tolerance:
		if agent_pos.x > target_pos.x:
			agent_commands.append("left_arrow")
		else:
			agent_commands.append("right_arrow")
		if agent_pos.y > target_pos.y:
			agent_commands.append("up_arrow")
		else:
			agent_commands.append("down_arrow")
		agent.commands = agent_commands
		
		return RUNNING
	
	else:
		return SUCCESS