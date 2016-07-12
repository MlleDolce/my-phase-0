# spy name, take 2

Spy_Names = {}

def spy_name_generator
	loop do
		puts "\nWelcome to the Spy Name Generator.  Please type a spy's full name. Type 'done' to exit."
		name = gets.chomp.to_s
			
		break if name == 'done'

		name_creator(name)
		puts "\nWell done.  Your fake name is now '#{name_creator(name)}'."
		Spy_Names[name] = name_creator(name)
	end	
	Spy_Names.each {|real_name, spy_name| puts "#{real_name} is now #{spy_name}"}
end

def name_creator(name)
	new_name_arr = swap_consonants(swap_vowels(name)).split(' ')
	new_name_arr.map {|word| word.capitalize }.join(' ')
end

#swap vowels
def swap_vowels(name)
	vowels = 'aeiou'
	result = ''

	swap_name(name).chars.each do |letter|
		if vowels.include?(letter) && letter != 'u'
			#find where letter is on vowels
			current_index = vowels.index(letter)
			#add 1
			next_index = current_index + 1
			#go back to vowels with index and retrieve new letter
			encrypted_letter = vowels[next_index]
			result += encrypted_letter
		elsif letter.downcase == 'u'
			encrypted_letter = 'a'
			result += encrypted_letter
		else
			result += letter
		end
	end
	result
end

def swap_consonants(name)
	cons = 'bcdfghjklmnpqrstvwxz'
	result = ''

	swap_name(name).chars.map do |letter|
		if cons.include?(letter) && letter != 'z'
			#find where letter is on vowels
			current_index = cons.index(letter)
			#add 1
			next_index = current_index + 1
			#go back to vowels with index and retrieve new letter
			encrypted_letter = cons[next_index]
			result += encrypted_letter
		elsif letter.downcase == 'z'
			encrypted_letter = 'a'
			result += encrypted_letter
		else
			result += letter
		end
	end
	result
end

def swap_name(name)
	name_array = name.downcase.split(' ')
	swapped_name = name_array.last + ' ' + name_array.first
end

spy_name_generator