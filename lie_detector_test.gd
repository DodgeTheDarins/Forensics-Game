extends Node2D
@onready var suspect_1b: Button = $"suspectselection/suspect1 (chef1)"
@onready var suspect_2b: Button = $"suspectselection/suspect2 (chef2)"
@onready var suspect_3b: Button = $"suspectselection/suspect3 (chef3)"
@onready var suspect_4b: Button = $"suspectselection/suspect4 (the kid)"
@onready var suspect_5b: Button = $"suspectselection/suspect5 (the waitress)"
@onready var suspect_6b: Button = $"suspectselection/suspect6 (the clerk)"


@onready var question_1: Button = $Node2D/question1
@onready var question_2: Button = $Node2D/question2
@onready var question_3: Button = $Node2D/question3

@onready var speechbubble: Sprite2D = $Speechbubble
@onready var label: Label = $Label


@onready var chef_1: Sprite2D = $Chef1
@onready var chef_2: Sprite2D = $Chef2
@onready var chef_3: Sprite2D = $Chef3
@onready var thekid: Sprite2D = $Thekid
@onready var waitress: Sprite2D = null   #change these to the new stuff
@onready var clerk: Sprite2D = null 

var suspect1 = bool(false)
var suspect2 = bool(false)
var suspect3 = bool(false)
var suspect4 = bool(false)
var suspect5 = bool(false)
var suspect6 = bool(false)

var done1 = bool(false)
var done11 = bool(false)
var done2 = bool(false)
var done22 = bool(false)
var done3 = bool(false)
var done33 = bool(false)
var done4 = bool(false)
var done44 = bool(false)
var done5 = bool(false)
var done55 = bool(false)
var done6 = bool(false)
var done66 = bool(false)

var talking = bool(false)
var questioning = bool(false)
var questionstage = int(0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	talking = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if done1: 
		suspect_1b.disabled = true
	if done2:
		suspect_2b.disabled = true
	if done3:
		suspect_3b.disabled = true
	if done4:
		suspect_4b.disabled = true
	if done5:
		suspect_5b.disabled = true
	if done6:
		suspect_6b.disabled = true
	
	if suspect_1b.button_pressed == true:
		chef_1.visible = true
		chef_2.visible = false
		chef_3.visible = false
		thekid.visible = false
		#waitress.visible = false
		#clerk.visible = false
		suspect1 = true
		suspect2 = false
		suspect3 = false
		suspect4 = false
		suspect5 = false
		suspect6 = false
		questionstage = 1
	if suspect_2b.button_pressed == true:
		chef_1.visible = false
		chef_2.visible = true
		chef_3.visible = false
		thekid.visible = false
		#waitress.visible = false
		#clerk.visible = false
		suspect1 = false
		suspect2 = true
		suspect3 = false
		suspect4 = false
		suspect5 = false
		suspect6 = false
		questionstage = 1
	if suspect_3b.button_pressed == true:
		chef_1.visible = false
		chef_2.visible = false
		chef_3.visible = true
		thekid.visible = false
		#waitress.visible = false
		#clerk.visible = false
		suspect1 = false
		suspect2 = false
		suspect3 = true
		suspect4 = false
		suspect5 = false
		suspect6 = false
		questionstage = 1
	if suspect_4b.button_pressed == true:
		chef_1.visible = false
		chef_2.visible = false
		chef_3.visible = false
		thekid.visible = true
		#waitress.visible = false
		#clerk.visible = false
		suspect1 = false
		suspect2 = false
		suspect3 = false
		suspect4 = true
		suspect5 = false
		suspect6 = false
		questionstage = 1
	if suspect_5b.button_pressed == true:
		chef_1.visible = false
		chef_2.visible = false
		chef_3.visible = false
		thekid.visible = false
		#waitress.visible = true
		#clerk.visible = false
		suspect1 = true
		suspect2 = false
		suspect3 = false
		suspect4 = false
		suspect5 = false
		suspect6 = false
		questionstage = 1
	if (suspect1 == true or suspect2 == true or suspect3 == true or suspect4 == true or suspect5 == true or suspect6 == true) and not talking:
		questioning = true
	else:
		questioning = false
		
	if questioning:
		question_1.visible = true
		question_2.visible = true
		question_3.visible = true
	else:
		question_1.visible = false
		question_2.visible = false
		question_3.visible = false
	
	if questioning and suspect1:
		if questionstage == 1:
			question_1.text = "where were you at the time of the murder?"
			question_2.text = "do you have an alibi?"
			question_3.text = "what colour are apples."
		if questionstage == 2:
			question_1.text = "how do you know the owner?"
			question_2.text = "have you had any arguments at the workplace lately?"
			question_3.text = "how many parents do you have?"
		if questionstage == 3:
			question_1.text = "what's 9 + 10?"
			question_2.text = "do you have any idea who the murderer could be?"
			question_3.text = "we know it's you, just confess."
	elif questioning and suspect2:
		if questionstage == 1:
			question_1.text = "where were you at the time of the murder?"
			question_2.text = "do you have an alibi?"
			question_3.text = "when did the man go to the doctor?"
		if questionstage == 2:
			question_1.text = "how do you know the owner?"
			question_2.text = "have you had any arguments at the workplace lately?"
			question_3.text = "have you ever hurt someone you know?"
		if questionstage == 3:
			question_1.text = "where did you get that cut?"
			question_2.text = "do you have any idea who the murderer could be?"
			question_3.text = "we know it's you, just confess."
	elif questioning and suspect3:
		if questionstage == 1:
			question_1.text = "where were you at the time of the murder?"
			question_2.text = "do you have an alibi?"
			question_3.text = "are you innocent?"
		if questionstage == 2:
			question_1.text = "how do you know the owner"
			question_2.text = "have you had any arguments at the workplace lately?"
			question_3.text = "how many fingers am I holding up?"
		if questionstage == 3:
			question_1.text = "how did you injure your palm?"
			question_2.text = "do you have any idea who the murderer could be?"
			question_3.text = "we know it's you, just confess."
	elif questioning and suspect4:
		if questionstage == 1:
			question_1.text = ""
			question_2.text = ""
			question_3.text = ""
		if questionstage == 2:
			question_1.text = ""
			question_2.text = ""
			question_3.text = ""
		if questionstage == 3:
			question_1.text = ""
			question_2.text = ""
			question_3.text = ""
	elif questioning and suspect5:
		if questionstage == 1:
			question_1.text = ""
			question_2.text = ""
			question_3.text = ""
		if questionstage == 2:
			question_1.text = ""
			question_2.text = ""
			question_3.text = ""
		if questionstage == 3:
			question_1.text = ""
			question_2.text = ""
			question_3.text = ""
	elif questioning and suspect6:
		if questionstage == 1:
			question_1.text = ""
			question_2.text = ""
			question_3.text = ""
		if questionstage == 2:
			question_1.text = ""
			question_2.text = ""
			question_3.text = ""
		if questionstage == 3:
			question_1.text = ""
			question_2.text = ""
			question_3.text = ""
	
	if talking and Input.is_action_just_pressed("next"):
		if label.visible_ratio == 1.0:
			talking = false
			questionstage += 1
		else:
			label.visible_ratio = 1.0
		if done1 and not done11:
			suspect1 = false
			suspect2 = true
			chef_1.visible = false
			chef_2.visible = true
			done11 = true
		if done2 and not done22:
			suspect2 = false
			suspect3 = true
			chef_2.visible = false
			chef_3.visible = true
			done11 = true
		if done3 and not done33:
			suspect3 = false
			suspect4 = true
			chef_3.visible = false
			thekid.visible = true
			done33 = true
	if questionstage == 4 and talking == false:
		talking = true
		label.text = "If that's all I'll be seeing myself out."
		questionstage = 0
		if suspect1:
			done1 = true
		if suspect2:
			done2 = true
		if suspect3:
			done3 = true
		if suspect4:
			pass
		if suspect6:
			pass
	if talking:
		speechbubble.visible = true
		label.visible_ratio += (delta/label.get_total_character_count()) * 16
	else:
		speechbubble.visible = false
		label.visible_ratio = 0.0
	if questioning:
		if questionstage == 1:
			if suspect1:
				if question_1.button_pressed == true:
					talking = true #where were you
					label.text = "I Didn't go to work that day. I took a sick day and spent it at my grandmas, you can ask her yourself."
				elif question_2.button_pressed == true:
					talking = true #alibi?
					label.text = "yes, I was at my grandmothers house, I was home sick, you can ask her if you let me contact her."
				elif question_3.button_pressed == true:
					talking = true #what where you doing
					label.text = "uh... red."
			elif suspect2:
				if question_1.button_pressed == true:
					talking = true
					label.text = "oh I was at the movies, left right after work to catch up with some old friends."
				elif question_2.button_pressed == true:
					talking = true
					label.text = "yeah, I went to the movies after work, left (the clerk) and (owner) to lock up."
				elif question_3.button_pressed == true:
					talking = true
					label.text = "at toothirty..."
			elif suspect3:
				if question_1.button_pressed == true:
					talking = true
					label.text = "I went home early that day, (owner) said I was just in the way"
				elif question_2.button_pressed == true:
					talking = true
					label.text = ""
				elif question_3.button_pressed == true:
					talking = true
					label.text = ""
			elif suspect4:
				if question_1.button_pressed == true:
					talking = true
					label.text = ""
				elif question_2.button_pressed == true:
					talking = true
					label.text = ""
				elif question_3.button_pressed == true:
					talking = true
					label.text = ""
			elif suspect5:
				if question_1.button_pressed == true:
					talking = true
					label.text = ""
				elif question_2.button_pressed == true:
					talking = true
					label.text = ""
				elif question_3.button_pressed == true:
					talking = true
					label.text = ""
			elif suspect6:
				if question_1.button_pressed == true:
					talking = true
					label.text = ""
				elif question_2.button_pressed == true:
					talking = true
					label.text = ""
				elif question_3.button_pressed == true:
					talking = true
					label.text = ""
		elif questionstage == 2:
			if suspect1:
				if question_1.button_pressed == true:
					talking = true #how do you know the owner
					label.text = "I've worked at this restaurant for many years, was one of (owner's name)'s first cooks, he was a good man but I didn't see him much outside of work."
				elif question_2.button_pressed == true:
					talking = true #have you had any arguments at the workplace lately
					label.text = "Not any major ones, but there is occasional bickering from the new recruits."
				elif question_3.button_pressed == true:
					talking = true # have you hever hurt someone
					label.text = "well I'm pretty sure the answers 2, but I haven't checked recently."
			elif suspect2:
				if question_1.button_pressed == true:
					talking = true # how do you know the owner
					label.text = "I met him when I applied for this job outta highschool, he's nice I guess but I think he pushes us too hard."
				elif question_2.button_pressed == true:
					talking = true
					label.text = "no."
				elif question_3.button_pressed == true:
					talking = true
					label.text = "I think everybody hurts someone from time to time."
			elif suspect3:
				if question_1.button_pressed == true:
					talking = true
					label.text = ""
				elif question_2.button_pressed == true:
					talking = true
					label.text = ""
				elif question_3.button_pressed == true:
					talking = true
					label.text = ""
			elif suspect4:
				if question_1.button_pressed == true:
					talking = true
					label.text = ""
				elif question_2.button_pressed == true:
					talking = true
					label.text = ""
				elif question_3.button_pressed == true:
					talking = true
					label.text = ""
			elif suspect5:
				if question_1.button_pressed == true:
					talking = true
					label.text = ""
				elif question_2.button_pressed == true:
					talking = true
					label.text = ""
				elif question_3.button_pressed == true:
					talking = true
					label.text = ""
			elif suspect6:
				if question_1.button_pressed == true:
					talking = true
					label.text = ""
				elif question_2.button_pressed == true:
					talking = true
					label.text = ""
				elif question_3.button_pressed == true:
					talking = true
					label.text = ""
		elif questionstage == 3:
			if suspect1:
				if question_1.button_pressed == true:
					talking = true #contact with workers on murder day
					label.text = "21, obviously"
				elif question_2.button_pressed == true:
					talking = true #who do you think it is
					label.text = "nobody in particular, but (ownername) has had a history of encouraging his workers to work harder."
				elif question_3.button_pressed == true:
					talking = true #we know it's you
					label.text = "I doubt that, I think I would have remembered something as serious as murder."
			elif suspect2:
				if question_1.button_pressed == true:
					talking = true # where cut
					label.text = "I guess I sliced so many vegtables it was hard to tell finger from food."
				elif question_2.button_pressed == true:
					talking = true # who do you think it was
					label.text = "I don't mean to point fingers but It was kinda suspicious how (clerk) was last at the restaurant alone with (owner)."
				elif question_3.button_pressed == true:
					talking = true # we know it's you
					label.text = "yeah right, I'm not falling for that."
			elif suspect3:
				if question_1.button_pressed == true:
					talking = true
					label.text = ""
				elif question_2.button_pressed == true:
					talking = true
					label.text = ""
				elif question_3.button_pressed == true:
					talking = true
					label.text = ""
			elif suspect4:
				if question_1.button_pressed == true:
					talking = true
					label.text = ""
				elif question_2.button_pressed == true:
					talking = true
					label.text = ""
				elif question_3.button_pressed == true:
					talking = true
					label.text = ""
			elif suspect5:
				if question_1.button_pressed == true:
					talking = true
					label.text = ""
				elif question_2.button_pressed == true:
					talking = true
					label.text = ""
				elif question_3.button_pressed == true:
					talking = true
					label.text = ""
			elif suspect6:
				if question_1.button_pressed == true:
					talking = true
					label.text = ""
				elif question_2.button_pressed == true:
					talking = true
					label.text = ""
				elif question_3.button_pressed == true:
					talking = true
					label.text = ""
		
		
		
		
