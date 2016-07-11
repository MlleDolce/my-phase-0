# Robot translator

Alphabet1Array = []
Alphabet2Array = []

def translator

	puts "Type a word or phrase to be translated to robot language."
	phrase = gets.chomp.to_s

	alphabet1 = "ABCDEFGHIJKLM"
	alphabet2 = "NOPQRSTUVWXYZ"
	alph1_letters = alphabet1.length
	alph2_letters = alphabet2.length

	alph1_letters.times do |counter_a1|
	#puts "running alph1_loop"
	a1_letter = alphabet1[counter_a1]
	Alphabet1Array << a1_letter
	end
	#puts Alphabet1Array

	alph2_letters.times do |counter_a2|
		#puts "running alph2_loop"
	a2_letter = alphabet2[counter_a2]
	Alphabet2Array << a2_letter
	end
	#puts Alphabet2Array

	robot_translation = ""

	input_letters = phrase.length

	input_letters.times do |counter_input|
	i_letter = phrase[counter_input]

		if Alphabet1Array.include? i_letter 
			i_letter = "bloop"
			robot_translation << i_letter
		elsif Alphabet2Array.include? i_letter || i_letter == "e"
			i_letter = "buzz"
			robot_translation << i_letter
		elsif i_letter == " "
			i_letter = "boing"
			robot_translation << i_letter
		else
			i_letter = "beep"
			robot_translation << i_letter
		end
	#puts robot_translation
	end
	p robot_translation
end

translator