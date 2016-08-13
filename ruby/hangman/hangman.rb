# 6.6 Solo Challenge: A Game Class
# Sat 8/6/16.  8pm - 11:30pm
# Sun 8/7 8:30pm - 12:30am
# Mon 8/8 10:30am - 5pm

# Pseudo-code your game for a computer to use:

# 1. Create a Class Hangman for the name of the game: Hangman
# 2. Create Initialize method for Hangman Class that takes a single parameter: word
# 	 a.) include instant variables for:
		# --word, guess_count and round number and make them readable outside the class
 		# --correct_guesses (an array that includes the letters that have been guessed correctly)
 		# --letter_slots-- calculate the length of the word
 		# 				-- for each character of the word, replace it with an underscore character.  Split this into an array.

#    Outside of Class:
# 3. Create a new instance of Hangman Class.  Pick a word as a parameter.

# 4. Create a loop for the game until the game is over (While the guess count is less than or equal to 9, the traditional hangman limit)
	    #-if word is completed, change 'is_over' variable to true 
    	#-Inside loop, call run_game instance method.  If method word_complete is true, display congratulatory message to user.

# 5.  Outside loop, write a "You guessed too many times" accompanied by a snooty comment if the guess count is too high.
#     For anything else, write a congratulatory line.  

# 6.  Create an instance method that runs the game: run_game.
#     This instance method should take two parameters: a single character & an array of sample letters in order to quickly test the program
#  		a.) Determine if he word contains the letter being guessed
#  		b.)  If the word contains the letter, calculate how many times the letter occurs in the word and
#  			obtain index numbers from each letter.
#  		c.) With the indices of the occurring letter, swap out the placeholder "_"'s in letter slots for the real letters
# 		d.) Increase the guess count if it is a new guess
#  		e.) At the end of the method, increase the count for the number of rounds

# 7.  Create a class method for determining if the game 'is_over': word_complete
	    # if word is completed, change 'is_over' variable to true
# 8.  Create a user_interface instance method for no's 4 & 5.  


require 'random_word_generator' 

class Hangman
	attr_reader :word, :guess_count, :round_number
	def initialize(word, test_letters)
		@word = word
		@rspec_test_letters = test_letters
		@guess_count = 0
		@round_number = 1
		#@incorrect_guesses = 0
		@is_over = false
		@correct_letters = []
		@incorrect_letters = []
		@letter_slots = ("_ " * @word.length).split(' ')
		#@rspec_test_letters = ["h","p","o","i","t","m","u","s"]
	end

	def word_rack
		@letter_slots.join(" ")
	end

	def word_complete
		if !@letter_slots.include?("_")
			@is_over = true
		else
			false
		end
	end

	def run_game(letter)
		# Updates the letter_slots for the next round of the game and increase the guess count
		# by one if the guess is not repeated:
		if @word.include?(letter.downcase) && !@correct_letters.include?(letter)
			puts "You have guessed correctly!  Your word contains letter #{letter}."
			if word.count(letter) > 1
				letter_indices = (0 ... @word.length).find_all {|i| @word[i,1] == letter} # searches word for all indices of the given letter
				letter_indices.each do |index_num|
					@letter_slots[index_num] = letter.upcase
				end
			else
				index_num = word.index(letter)
				@letter_slots[index_num] = letter.upcase
			end
			@guess_count += 1
			@correct_letters.push(letter)
		elsif @word.include?(letter.downcase) && @correct_letters.include?(letter)
			puts "You've already guessed this letter correctly."
			@guess_count = @guess_count
		else
			puts "Sorry, the word does not contain letter #{letter}. \n-----------"
			if !@word.include?(letter.downcase) && @incorrect_letters.include?(letter)
				puts "You've already guessed this incorrect letter."
			else
				@incorrect_letters.push(letter)
				@guess_count += 1
			end
		end
		@round_number += 1
	end

	def user_interface
		if @round_number == 1
			puts "Welcome to Ruby Hangman."  
			puts "You will be given a maximum of twelve turns to guess the letters of the chosen word."  
			puts "Let's get started!"  
		end

		# Method will stop looping if guess count is greater than 9 or if the word is complete:
		while @guess_count < 12
			if !@word_complete
				puts "------------\nRound #{@round_number}, \nGuess ##{@guess_count} \nHere is your word:"
				puts word_rack
				puts
				puts "Guess a letter! (a single letter)"
				#letter = test_letters[@round_number - 1] # for random_num_gen, computer testing
				letter = gets.chomp.to_s
				letter = letter.downcase
				run_game(letter)
			else
				puts "----------- \n Congratulations!  You win!  The word you completed is: \n #{word_rack}"
			end
		end

		if @guess_count >= 12
			puts "Game over.  Too many guesses... The word you were trying to guess is '#{@word}'."
			puts "My dog is better at this game than you are!"
		end
	end
end

def random_word_gen
	word = RandomWordGenerator.word
	if word.length > 5 && word.length < 10 && !word.include?("_")
		return word
	else
		random_word_gen
	end
end
 
def random_letter_gen
	random_letters = (['a','e','i','o','u'].sample(3)).concat(('a'..'z').to_a.sample(30))
end

#game = Hangman.new("hippopotomus", ["h","p","o","i","t","m","u","s"])
game = Hangman.new(random_word_gen, random_letter_gen)

#Hangman User Interface:
game.user_interface  # comment out this driver code to test the rspec
