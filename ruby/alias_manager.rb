# pseudocode and write a method that takes a spy's real name (e.g., "Felicia Torres") 
# and creates a fake name with it by doing the following:
# date: Sunday July 10, 2016.  
#Release 0: 3:30pm - 6:00pm


def spy_name_generator
	puts "What is your full name?"
	name = gets.chomp.to_s
	split_name = name.split(' ')
	reverse_name = split_name.reverse.join(' ')
	p letters = reverse_name.split('')

	letters.map! do |letter| 
		vowels = ['a', 'e', 'i', 'o', 'u']
		consonants_str = 'bcdfghjklmnpqrstvwxz'
		consonants = consonants_str.split('')
		if vowels.include?(letter) || vowels.include?(letter.downcase) == true
			p letter = letter.downcase
			index_before = vowels.index(letter)
			vowels.rotate!
			#p index_after = vowels.index(letter)
			p letter = vowels[index_before]
		elsif consonants.include?(letter) || consonants.include?(letter.downcase) == true
			p letter = letter.downcase
			index_before = consonants.index(letter)
			consonants.rotate!
			p letter = consonants[index_before]
		else
			p letter = letter
		end
	end
	p spy_name = letters.join.split(' ').each{|name| name.capitalize!}.join(' ')
end



