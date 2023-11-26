extends CharacterBody2D

@onready var animations = $AnimatedSprite2D
const SPEED = 400.0
var state = "idle"
func  movement():
	
	if velocity.x<0:
		animations.flip_h=true
		animations.play("ler")
		$Audiow.play()
		state="idle_lr"
	elif velocity.x>0:
		animations.flip_h=false
		animations.play("ler")
		$Audiow.play()
		state="idle_lr"
	elif velocity.y>0:
		animations.play("down")
		$Audiow.play()
		state="idle"
	elif velocity.y<0:
		animations.play("up")
		$Audiow.play()
		state="idle_up"
	else :
		$Audiow.stop()
		animations.play(state)
func _physics_process(_delta):
	var direction = Input.get_vector("ui_left", "ui_right","ui_up","ui_down")
	velocity = direction * SPEED
	movement()
	move_and_slide()
	
