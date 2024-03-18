extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var gameObject = {
	1: {
		"question": "Are you more energized by:",
		"options": ["Interacting with people and sealing deals", "Crunching numbers and analyzing data", "Hiding in the break room and avoiding eye contact", "Daydreaming about becoming the CEO while pretending to work"],
		"animation": "option1" 
	},
	2: {
		"question": "When facing a challenge, do you:",
		"options": ["Dive in headfirst and charm your way to success", "Strategize meticulously and weigh all options", "Panic and consider faking an illness to get out of it", "Blame someone else and hope it blows over"],
		"animation": "option2" 
	},
	3: {
		"question": "Your ideal work environment involves:",
		"options": ["Networking events and client meetings", "Quiet, focused spaces with minimal distractions", "A constant supply of coffee and memes", "A corner office with a view and a personal assistant"],
		"animation": "option3" 
	},
	4: {
		"question": "How do you handle criticism?",
		"options": ["Turn on the charm and persuade them otherwise", "Analyze it objectively and seek ways to improve", "Cry in the bathroom and update your resume", "Brush it off and continue with business as usual"],
		"animation": "option4"
	},
	5: {
		"question": "In your free time, you enjoy:",
		"options": ["Schmoozing at social gatherings and closing deals", "Engaging in intellectually stimulating activities", "Binge-watching Netflix and ordering takeout", "Plotting your rise to power and world domination"],
		"animation": "option5" 
	},
	6: {
		"question": "When faced with a tight deadline, you:",
		"options": ["Rise to the occasion with adrenaline-fueled productivity", "Organize your tasks meticulously and prioritize effectively", "Organize your tasks meticulously and prioritize effectively", "Organize your tasks meticulously and prioritize effectively"],
		"animation": "option6" 
	},
	7: {
		"question": "When it comes to team projects, you:",
		"options": ["Take charge and lead the team to victory", "Collaborate closely with your team, leveraging everyone's strengths", "Disappear into the background and hope nobody notices your absence", "Manipulate your way into taking credit for the team's success"],
		"animation": "option7" 
	},
	8: {
		"question": "Your approach to networking events involves:",
		"options": ["Mingling with confidence and making connections effortlessly", "Researching attendees beforehand to strategically target key contacts", "Finding excuses to avoid attending altogether", "Turning every interaction into a sales pitch for yourself."],
		"animation": "option8" 
	},
	9: {
		"question": "Your reaction to a new corporate policy change is:",
		"options": ["Embracing it enthusiastically and seeing it as an opportunity", "Analyzing its potential impact and devising strategies to adapt", "Complaining loudly to anyone who will listen and circulating a petition", "Ignoring it completely and hoping it goes away on its own"],
		"animation": "option9" 
	},
	10: {
		"question": "Your reaction to a colleague's promotion is:",
		"options": ["Congratulating them sincerely and offering your support", "Analyzing their career trajectory and strategizing your next move", "Sabotaging their efforts behind the scenes and spreading rumors", "Pretending to be happy for them while secretly plotting their downfall"],
		"animation": "option10" 
	},
	11: {
		"question": "Your approach to handling a difficult client is:",
		"options": ["Charm them into submission with your winning personality", "Analyze their needs and tailor your approach accordingly", "Pass them off to someone else and hope they never come back", "Manipulate them into thinking they're getting a great deal while maximizing profits for the company"],
		"animation": "option11" 
	},
	12: {
		"question": "When presented with a new project, do you:",
		"options": ["Dive into brainstorming sessions and collaboration with excitement", "Delve into thorough research, analyzing every aspect before moving forward.", "Delegate tasks efficiently to streamline project execution.", "Dream of future accolades and recognition."],
		"animation": "option12" 
	},
	13: {
		"question": "When faced with a team-building exercise, you:",
		"options": ["Dive in with enthusiasm and rally your team with motivational speeches", "Participate reluctantly, secretly plotting escape routes in case things get too cheesy", "Hide in the bathroom until it's over, avoiding any forced social interaction", "Use the opportunity to network and schmooze with higher-ups, angling for a promotion"],
		"animation": "option13" 
	},
	14: {
		"question": "Your response to an office gossip rumor about you is:",
		"options": ["Laugh it off and turn it into a funny anecdote to share with colleagues", "Address it directly with the gossip monger and set the record straight", "Ignore it and hope it dies down on its own, focusing on your work", "Spread an even juicier rumor to divert attention away from yourself"],
		"animation": "option14" 
	},
	15: {
		"question": "Your reaction to a team member's mistake affecting your project is:",
		"options": ["Offer support and guidance to help them rectify the error", "Analyze the impact of the mistake and devise a plan to mitigate its effects", "Blame them publicly and make sure everyone knows it was their fault", "Use the opportunity to showcase your own competence and offer to take over the project"],
		"animation": "option15" 
	}
}

var current_question_index = 1

func _ready():
	# Load the first question
	_load_question(current_question_index)

func _on_Option1_pressed():
	_move_to_next_question()

func _on_Option2_pressed():
	_move_to_next_question()

func _on_Option3_pressed():
	_move_to_next_question()

func _on_Option4_pressed():
	_move_to_next_question()

func _move_to_next_question():
	#
	$OptionsContainer/QuestionPanel/Option1.visible = false
	$OptionsContainer/QuestionPanel/Option2.visible = false
	$OptionsContainer/QuestionPanel/Option3.visible = false
	$OptionsContainer/QuestionPanel/Option4.visible = false
	# Increment the current question index
	current_question_index += 1
	
	
	# Check if there are more questions
	if current_question_index <= gameObject.size():
		var current_question = gameObject[current_question_index]
		_load_question(current_question_index)
		$Options.play(current_question["animation"])
	else:
		# All questions have been answered, you can add code here for any final actions
		$Options.stop()
		$Response.stop()
		$Questions.stop()
		print("All questions have been answered.")
		$EndingAnimation.play("ending")
		

func _load_question(question_index):
	# Get the current question from the gameObject dictionary
	var current_question = gameObject[question_index]
	
	# Set the question text
	$OptionsContainer/Question.text = current_question["question"]
	
	# Set the option texts
	$OptionsContainer/QuestionPanel/Option1.text = current_question["options"][0]
	$OptionsContainer/QuestionPanel/Option2.text = current_question["options"][1]
	$OptionsContainer/QuestionPanel/Option3.text = current_question["options"][2]
	$OptionsContainer/QuestionPanel/Option4.text = current_question["options"][3]
	


func _on_IntroAnimation_animation_finished(anim_name):
	$Options.play("option1")


func _on_Option5_pressed():
	$Results.visible = true


func _on_TransitionAnimation_animation_finished(anim_name):
	$IntroAnimation.play("intro")
