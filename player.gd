extends KinematicBody2D

# class member variables go here:
var max_force
var player_name
var ball_color
var ball_vector = Vector2()
var collision
export (float) var friction

func _ready():
	ball_color = Color(1.0, 0.0, 0.0, 0.5)
	max_force = 200

func _draw():
	draw_line(Vector2(), get_local_mouse_position().clamped(max_force), Color(0.0, 0.0, 0.0), 1.0, false)
	#draw_circle(Vector2(), 25, ball_color)

func _process(delta):
	update()

func _physics_process(delta):
	check_hit()
	ball_vector = ball_vector * friction
	collision = move_and_collide(ball_vector * delta)
	if collision:
			ball_vector = ball_vector.bounce(collision.normal)
			move_and_collide(ball_vector * delta)

func check_hit():
	if Input.is_action_just_pressed("touch_main"):
		ball_vector = get_local_mouse_position().clamped(max_force)

#func _integrate_forces(state):
#	if Input.is_action_just_pressed("touch_main"):
#		apply_impulse(Vector2(), - get_local_mouse_position().clamped(max_force) * 2)