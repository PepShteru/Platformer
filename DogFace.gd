extends Sprite

var disappear_timer: Timer

func _ready():
	# Find the Timer node in the scene
	disappear_timer = $Timer
	# Connect the timeout signal to the _on_disappear_timeout function
	disappear_timer.connect("timeout", self, "_on_disappear_timeout")
	# Start the timer
	disappear_timer.start()

func _on_disappear_timeout():
	# Hide the sprite when the timer times out
	hide()
