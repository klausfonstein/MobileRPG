extends Node2D
export(int) var hp = 25 setget set_hp
export(int) var damage = 3
const BattleUnits = preload("res://BattleUnits.tres")

onready var hpLabel = $HpLabel
onready var animationPlayer = $AnimationPlayer


signal died

signal end_turn



func set_hp(new_hp):
	hp = new_hp
	if hpLabel != null:
		hpLabel.text = str(new_hp) + "hp"
	
func _ready() -> void:
	BattleUnits.Enemy = self

func _exit_tree() -> void:
	BattleUnits.Enemy = null

func attack() -> void:
	yield(get_tree().create_timer(0.4), "timeout")
	animationPlayer.play("Attack")
	yield(animationPlayer, "animation_finished")	
	emit_signal("end_turn")


func take_damage(amount):
	self.hp -= amount
	if is_dead():
		emit_signal("died")
		queue_free()
	else:
		animationPlayer.play("Shake")
		
func deal_damage():
	BattleUnits.PlayerStats.hp -= damage
	print("You`r bleeding!")
	
	
func is_dead():
	
	return hp <= 0










