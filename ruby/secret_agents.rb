# 4.6: Release 2: Writing in pseudo-coding

# Encrypt method 
# that advances every letter of a string one letter forward. 
# So "abc" would become "bcd". For now, you can assume lowercase input and output. 
# Any space character should remain a space character -- no change made.

# Set up a loop that progresses each letter of a string until the last letter is reached
# 1.  Before the loop starts:
# => a.) create a counter variable 'counter' set equal to '0'
# => b.) Before loop, print "before loop"

# 2.  Once inside the loop:
# => a.) Start the loop with: while counter <= "string".length
# => b.) Inside loop, print "running loop"
# => c.) Use index to call upon the first letter of the string and advance it to the next letter: puts "string"[i].next
# => d.) set increment at end of loop: counter += 1
# => e.) *** How do I set a variable for "string"[i].next to store each loop, and print it in a row?  
#        Theory: "string"[i].next = changing_letters ---> total += changing_letters
# => f.) end loop with 'end'

# puts "Enter a word to be encrypted."
# word = gets.chomp.to_s

def encrypt(word)

	counter =  0
	encrypted = Array.new

	while counter < word.length
		##puts "running while loop"
		##puts word[counter]
		
		initial_character = word[counter]
		current_character = word[counter].next
		
		if initial_character == ' '
			encrypted << ' '
		elsif initial_character == "z"
			encrypted << "a"
		else
			encrypted << current_character
		end
		
		counter += 1
		
		if counter == word.length
		puts "Your password is: #{encrypted.join("")}"
		end
	end
end


# Decrypt method 
# that reverses the process above. 
# Note that Ruby doesn't have a built-in method for going backward one letter. 
# How can you find out where a letter is in the alphabet, then access the letter right before it? 
# Hint: In the IRB session above, you learned how to ask a string for the index of a letter. 
# "abcdefghijklmnopqrstuvwxyz" counts as a string.


#  Step one: Using the alphabet, create a method for determining backwards letters for a single letter.

# 1.  Write code for determining the position of a letter in the alphabet: "abcdefghijklmnopqrstuvwxyz".index(alphabet_letter)
# 2.  Write code for determining the letter before this letter.  
#     eg: find the letter before 'd'
#     --find d's index number in the alphabet: index(d) = 3
#     --write formula for finding the index number of the letter before 'd'
#     -- set formula to a variable: 
# => i - 1 = backwards_letter
# 3.  Now that we have the alphabet index number of backwards_letter, call the letter with our new variable, and: print it
# => puts "abcdefghijklmnopqrstuvwxyz"[backwards_letter]

# Step two: create method for looping this code so that we can cycle through the letters of the entire word.

# 1.  Write 'counter = 0' at the beginning of the code to set a counter equals to zero so the loop will have somewhere to start
# 2.  Create code to determine the first letter of the word.
# 	How does the program know what to set 'i' equals to at the beginning of the loop?
# => "string"[i]
# 3.  Write loop:
# => a.) while i <= "string".length
# => b.) Get a letter from the string and assign it to 'alphabet_letter'
#    "string"[i] = alphabet_letter
# => c.) add our code from step one:
#   puts "abcdefghijklmnopqrstuvwxyz"[backwards_letter]
# => d.) set increment at end: counter += 1
# => e.) end loop with 'end'

# puts "Enter a word to be decrypted."
# word = gets.chomp.to_s

def decrypt(word)

	counter =  0
	decrypted = Array.new

	while counter < word.length
		##puts "running while loop"
		##puts word[counter]

		current_letter = word[counter]

		index_search = "abcdefghijklmnopqrstuvwxyz".index(current_letter)
		backwards_index = index_search - 1 
		##puts "abcdefghijklmnopqrstuvwxyz"[backwards_index]

		backwards_letter = "abcdefghijklmnopqrstuvwxyz"[backwards_index]

		decrypted << backwards_letter

		counter += 1

		if counter == word.length
		puts "Your answer is: #{decrypted.join("")}"
		end
	end
end

def interface_encrypt_decrypt
	puts "Would you like to encrypt or decrypt a password?"
	answer = gets.chomp.to_s
	puts "Ok you chose #{answer}.  Please type your password."
	password = gets.chomp.to_s

	if answer == "encrypt"
		puts encrypt(password)
	elsif answer == "decrypt"
		puts decrypt(password)
	else 
		puts "Choose either 'encrypt' or 'decrypt'"
	end
end

puts interface_encrypt_decrypt