extends RigidBody2D

# class member variables go here:
var max_force
var player_name
var ball_color

func _ready():
	ball_color = Color(1.0, 0.0, 0.0)
	max_force = 200

func _draw():
	draw_line(Vector2(), get_local_mouse_position().clamped(max_force), Color(0.0, 0.0, 0.0), 2.0, false)
	draw_circle(Vector2(), 25, ball_color)

func _process(delta):
	update()

func _integrate_forces(state):
	if Input.is_action_just_pressed("touch_main"):
		apply_impulse(Vector2(), - get_local_mouse_position().clamped(max_force) * 2)
