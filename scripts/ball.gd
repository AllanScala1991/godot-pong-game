extends CharacterBody2D

var started = false
var start_speed = 500
var incremental_speed = 1.0
var angle = [-250, 250]
var pongs = 0

func _physics_process(delta):
	if Input.is_action_pressed("ui_accept") and started == false:
		start_game()
		
	if started:
		var colission = move_and_collide(velocity * delta)
		if colission != null:
			if colission.get_collider().name == "TopWall":
				pongs += 1
				velocity = velocity.bounce(colission.get_normal()) * incremental_speed
			else:
				velocity = velocity.bounce(colission.get_normal())

func start_game():
	started = true
	velocity.y = -start_speed
	velocity.x = angle.pick_random()
