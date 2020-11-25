extends Panel

onready var hpLabel = $StatsContainer/HP
onready var apLabel = $StatsContainer/AP
onready var mpLabel = $StatsContainer/MP



func _ready() -> void:
	pass


func _on_PlayerStats_hp_changed(value) -> void:
	hpLabel.text = str(value)+"\nHP"


func _on_PlayerStats_ap_changed(value) -> void:
	apLabel.text = str(value)+"\nAP"


func _on_PlayerStats_mp_changed(value) -> void:
	mpLabel.text = str(value)+"\nMP"
