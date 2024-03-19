extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var gameObject = {
	1: {
		"question": "Are you more energized by:",
		"options": ["Interacting with people and sealing deals", "Crunching numbers and analyzing data", "Hiding in the break room and avoiding eye contact", "Daydreaming about becoming the CEO"],
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
		"options": ["Rise to the occasion", "Organize tasks effectively", "Seek assistance from team", "Utilize time management"],
		"animation": "option6" 
	},
	7: {
		"question": "When it comes to team projects, you:",
		"options": ["Take charge and lead", "Collaborate with team", "Disappear into the background", "Manipulate to take credit"],
		"animation": "option7" 
	},
	8: {
		"question": "Your approach to networking events involves:",
		"options": ["Mingle with confidence", "Research attendees strategically", "Find excuses to avoid", "Turn interactions into sales pitch"],
		"animation": "option8" 
	},
	9: {
		"question": "Your reaction to a new corporate policy change is:",
		"options": ["Embrace it enthusiastically", "Analyze its impact and adapt", "Complain loudly and circulate petition", "Ignore it and hope it goes away"],
		"animation": "option9" 
	},
	10: {
		"question": "Your reaction to a colleague's promotion is:",
		"options": ["Congratulate them sincerely", "Analyze their career and strategize", "Sabotage their efforts", "Pretend to be happy while plotting"],
		"animation": "option10" 
	},
	11: {
		"question": "Your approach to handling a difficult client is:",
		"options": ["Charm them into submission", "Tailor your approach to their needs", "Pass them off to someone else", "Manipulate them for profit"],
		"animation": "option11" 
	},
	12: {
		"question": "When presented with a new project, do you:",
		"options": ["Dive into brainstorming", "Thorough research and analysis", "Delegate tasks efficiently", "Dream of future accolades"],
		"animation": "option12" 
	},
	13: {
		"question": "When faced with a team-building exercise, you:",
		"options": ["Dive in with enthusiasm and rally your team with motivational speeches", "Participate reluctantly, secretly plotting escape routes in case things get too cheesy", "Hide in the bathroom until it's over, avoiding any forced social interaction", "Use the opportunity to network and schmooze with higher-ups, angling for a promotion"],
		"animation": "option13" 
	},
	14: {
		"question": "Your response to an office gossip rumor about you is:",
		"options": ["Laugh it off and share", "Address it directly", "Ignore and focus on work", "Spread an even juicier rumor"],
		"animation": "option14" 
	},
	15: {
		"question": "Your reaction to a team member's mistake affecting your project is:",
		"options": ["Offer support and guidance", "Analyze the impact and mitigate", "Blame them publicly", "Showcase your competence"],
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


func _on_Submission_pressed():
	OS.shell_open("https://google.com") 
