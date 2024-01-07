extends Node2D

onready var audio_player: AudioStreamPlayer2D = $MMBG
onready var button: Button = $Control/StartButton

func _ready():
	audio_player.stop()
	

func _on_StartButton_pressed():
	audio_player.stop()
	
