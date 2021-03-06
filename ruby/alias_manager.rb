# pseudocode and write a method that takes a spy's real name (e.g., "Felicia Torres") 
# and creates a fake name with it by doing the following:
# date: Sunday July 10, 2016.  
#Release 0: 3:30pm - 6:00pm


Spy_Names = Hash.new

def spy_name_generator
	loop do
		puts "Welcome to the Spy Name Generator.  Please type your full name. Type 'done' to exit."
		name = gets.chomp.to_s
		
		if name.include?('done')
			Spy_Names.each {|real_name, spy_name| puts "#{real_name} is now #{spy_name}"}
			exit
		end

		split_name = name.split(' ')
		reverse_name = split_name.reverse.join(' ')
		letters = reverse_name.split('')
	
		letters.map! do |letter| 
			vowels = ['a', 'e', 'i', 'o', 'u']
			consonants_str = 'bcdfghjklmnpqrstvwxz'
			consonants = consonants_str.split('')
			if vowels.include?(letter) || vowels.include?(letter.downcase)
				letter = letter.downcase
				index_before = vowels.index(letter)
				vowels.rotate!
				#p index_after = vowels.index(letter)
				letter = vowels[index_before]
			elsif consonants.include?(letter) || consonants.include?(letter.downcase)
				letter = letter.downcase
				index_before = consonants.index(letter)
				consonants.rotate!
				letter = consonants[index_before]
			else
				letter = letter
			end
		end
	
		spy_name = letters.join.split(' ').each{|name| name.capitalize!}.join(' ')
	
		puts "Well done.  Your fake name is now #{spy_name}."
		Spy_Names[name] = spy_name
	end
end

spy_name_generator


