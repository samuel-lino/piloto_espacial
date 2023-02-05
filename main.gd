extends Node

var vida = 0
var energia = 0
var vida_max = 100
var energia_max = 50
var pontos = 0
var cristais = 0
var dano = 0
var tempo = 0
var score = {"1": 0, "2": 0, "3": 0, "4": 0, "5": 0, "6": 0, "7": 0, "8": 0, "9": 0, "10": 0}
var temporario = 0
var stop = false
var kitsreparo = 0
var explosion = false
var save_path = "user://save.dat"

func _ready():
	var file: File = File.new()
	if file.file_exists(save_path):
		var error = file.open(save_path, File.READ)
		if error == OK:
			score = file.get_var()
			file.close()
func _process(delta):
	energia = clamp(energia, 0, energia_max)
	vida = clamp(vida, 0, vida_max)

func rank(ponto:int, posi:String)->void:
	score[posi] = ponto
	pontos = 0

func classificque(ponto:int)->void:
	var posi = 1
	for pos in score.size():
		if score[str(posi)] < ponto:
			temporario = score[str(posi)]
			rank(ponto, str(posi))
			classificque(temporario)
			return
		posi += 1
			
			
func salvar():
	var file : File = File.new()
	var error = file.open(save_path, File.WRITE)
	if error == OK:
		file.store_var(score)
		file.close()
