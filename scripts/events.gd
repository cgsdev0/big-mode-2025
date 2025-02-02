extends Node


signal meter_angry
signal meter_calm

signal transition
signal teleport

enum Tooltip {
	NONE,
	UP,
	POP,
	TOO_HARD,
}

var tooltip: Tooltip = Tooltip.UP

signal hide_tooltip
signal show_tooltip(tooltip: Tooltip)

func _ready():
	show_tooltip.connect(_on_show)
	hide_tooltip.connect(_on_hide)
	
func _on_show(t: Tooltip):
	tooltip = t
	
func _on_hide():
	tooltip = Tooltip.NONE
	
	
var planet_destroyed = false
var score: int = 99999 if OS.is_debug_build() else 0
signal score_changed

var charge = 0.0

func add_score(diff: int):
	score += diff
	score_changed.emit()
