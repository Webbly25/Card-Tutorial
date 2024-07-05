class_name ActionPayload
extends Resource

var caster: Character
var targets: Array[Character]

func _init(_caster: Character=null, _targets: Array[Character]=[]):
	caster = _caster
	targets = _targets