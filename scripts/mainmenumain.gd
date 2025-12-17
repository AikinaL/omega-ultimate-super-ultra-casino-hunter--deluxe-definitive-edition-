extends Control
@onready var quitter = $Quitter
var screensize = DisplayServer.screen_get_size()
var random = RandomNumberGenerator.new()
var randomX = random.randi_range(175, screensize.x - 175)
var randomY = random.randi_range(45, screensize.y - 45)
# Called when the node enters the scene tree for the first time.
func _ready():
	MusicManager.play_music(preload("res://Sound/Music/thereisnogame-alternative-version.mp3"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


#region Jouer

func _on_jouer_pressed():
	get_tree().change_scene_to_file("res://video.tscn")

func _on_jouer_mouse_entered():
	$Jouer/AnimationPlayer.play("zoom_in_out")


#func _on_jouer_mouse_exited():
	#$Jouer/AnimationPlayer.stop()
#endregion


#region Connexion
func _on_connexion_pressed():
	get_tree().change_scene_to_file("res://scenes/connexion.tscn")

func _on_connexion_mouse_entered():
	$Connexion/AnimationPlayer.play("zoom_in_out")

#func _on_connexion_mouse_exited():
	#$Connexion/AnimationPlayer.stop()


#endregion


#region Niveaux
func _on_niveaux_pressed():
	get_tree().change_scene_to_file("res://scenes/niveauxquestionmark.tscn")


func _on_niveaux_mouse_entered():
	$Niveaux/AnimationPlayer.play("zoom_in_out")


#func _on_niveaux_mouse_exited():
	#$Niveaux/AnimationPlayer.stop()

#endregion


#region HighScore
func _on_high_score_mouse_entered():
	$HighScore/AnimationPlayer.play("zoom_in_out")

func _on_high_score_pressed():
	get_tree().change_scene_to_file("res://scenes/high_score.tscn")

#func _on_high_score_mouse_exited():
	#$HighScore/AnimationPlayer.stop()
#endregion


#region Boutique
func _on_boutique_pressed():
	get_tree().change_scene_to_file("res://scenes/boutique.tscn")

func _on_boutique_mouse_entered():
	$Boutique/AnimationPlayer.play("zoom_in_out")


#func _on_boutique_mouse_exited():
	#$Boutique/AnimationPlayer.stop()
#endregion


#region ChatPublic
func _on_chat_public_mouse_entered():
	$ChatPublic/AnimationPlayer.play("zoom_in_out")

func _on_chat_public_pressed():
	get_tree().change_scene_to_file("res://scenes/chat_public.tscn")

#func _on_chat_public_mouse_exited():
	#$ChatPublic/AnimationPlayer.stop()
#endregion


#region Réseaux
func _on_réseaux_mouse_entered():
	$"Trivia/Réseaux/AnimationPlayer".play("rotate")

func _on_réseaux_pressed():
	get_tree().change_scene_to_file("res://scenes/reseauuux.tscn")
#func _on_réseaux_mouse_exited():
	#$"Trivia/Réseaux/AnimationPlayer".stop()
#endregion


#region Options
func _on_options_pressed():
	get_tree().change_scene_to_file("res://scenes/optionmenuoption.tscn")

func _on_options_mouse_entered():
	$Trivia/Options/AnimationPlayer.play("rotate")


#func _on_options_mouse_exited():
	#$Trivia/Options/AnimationPlayer.stop()

#endregion


#region Crédits
func _on_crédits_pressed():
	get_tree().change_scene_to_file("res://scenes/créditscréditables.tscn")

func _on_crédits_mouse_entered():
	$"Trivia/Crédits/AnimationPlayer".play("rotate")


#func _on_crédits_mouse_exited():
	#$"Trivia/Crédits/AnimationPlayer".stop()
#endregion


#region Bonus
func _on_bonus_mouse_entered():
	$Trivia/Bonus/AnimationPlayer.play("rotate")

func _on_bonus_pressed():
	get_tree().change_scene_to_file("res://scenes/boonus.tscn")

#func _on_bonus_mouse_exited():
	#$Trivia/Bonus/AnimationPlayer.stop()
#endregion


#region Quitter
func _on_quitter_pressed():
	var parent_size = get_parent().size
	var button_size = size 
	randomX = random.randi_range(175, screensize.x - 175)
	randomY = random.randi_range(175, screensize.y - 175)
	quitter.global_position = Vector2(randomX, randomY)

func _on_quitter_mouse_entered():
	$Quitter/AnimationPlayer.play("zoom_and_rotate")
#endregion
