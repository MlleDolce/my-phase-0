# 6.6 Solo Challenge: A Game Class
# 7:40pm

# Pseudo-code your game for a computer to use:

# 1. Create a Class Hangman for the name of the game: Hangman
# 2. Create Initialize method for Hangman Class that takes a single parameter: word
# 	 a.) include instant variables for:
		# --word, guess_count and is_over and make them readable outside the class
 		# --correct_guesses (an array that includes the letters that have been guessed correctly)
 		# --letter_slots-- calculate the length of the word
 		# 				-- for each character of the word, replace it with an underscore character.  Split this into an array.

#    Outside of Class:
# 3. Create a new instance of Hangman Class.  Pick a word as a parameter.

# 4. Create a loop for the game until the game is over
#    a.) Inside Class, create a class method for determining if the game 'is_over': word_complete
	    # if word is completed, change 'is_over' variable to true
	    # if the guess count is greater than 9 (traditional hangman guess limit), the game is over
	    # anything else will return false  
#    b.) Inside loop, call run_game instance method

# 5.  Outside loop, write congratulatory line for completing the game if guess count is less than 9.  
#     For anything else, write a snooty remark.

# 6.  Create a recursive Class instance method that runs the game: run_game.
#     This instance method should take two parameters: a single character & an array of correct letters that have been guessed already
#     ** Create base case for recursion: If game is not equal to is_over

#     a.)Display the word placeholder from letter_slots 
#               --  join this array with a space in between every item/underscore.
#  	  b.)Ask the user to guess a letter
		# Increase the guess_count meter by one. 
#     c.) Search the word for an occurrence of the character
#     d.) If the word contains the character, tell the user that they have guessed correctly.  
#     e.) Add the correct character to the correct_guesses array 
#       # for each character already guessed correctly(check correct_guesses array), 
		# replace the appropriate index number in letter_slots with the character
#     f.) Recursively call run_game
#     
# 7.  Create a class method for determining if the game 'is_over': word_complete
	    # if word is completed, change 'is_over' variable to true
	    # if the guess count is greater than 9 (traditional hangman guess limit), the game is over
	    # anything else will return false  


# Write driver code to test the game.  Create a new instance of the Class that takes a variable: word

# Design a user-interface for two players.  The first player runs the game by providing the 'word', while the 2nd player 
# continues to guess what the word is until he/she runs out of guesses.
