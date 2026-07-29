extends Node

@onready var musique: AudioStreamPlayer = $Musique
@onready var bruitage: AudioStreamPlayer = $Bruitage


var dico_sons = {
	"musique_background" : preload("res://sons_musique/Twinkle_Twinkle_Little_Star_plain.ogg"),
	"bruitage_bouton" : preload("res://sons_musique/On a perdu la victoire mais on a pas perdu la défaite.mp3"),
}
func fct_musique(nom_musique: String):
	if dico_sons.has(nom_musique):
		musique.stream = dico_sons[nom_musique]
		musique.play()
		
func fct_bruitage(nom_bruitage: String):
	if dico_sons.has(nom_bruitage):
		bruitage.stream = dico_sons[nom_bruitage]
		bruitage.play()
