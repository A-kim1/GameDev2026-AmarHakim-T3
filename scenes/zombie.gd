extends CharacterBody2D

@export var speed = 80
@export var patrol_distance = 700

var start_x
var direction = 1

@onready var sprite = $AnimatedSprite2D
@onready var hit_sound = $"../playerHit"

func _ready():
	start_x = global_position.x
	sprite.play("move")

func _physics_process(delta):

	velocity.x = speed * direction
	move_and_slide()

	# balik arah kalo udh jalan sejauh 700 px gituu
	if abs(global_position.x - start_x) > patrol_distance:
		direction *= -1
		sprite.flip_h = direction < 0


func _on_area_2d_body_entered(body):
	print("KENA:", body.name)
	if body.name == "Player Solo":
		hit_sound.play()
		await hit_sound.finished
		get_tree().reload_current_scene()
