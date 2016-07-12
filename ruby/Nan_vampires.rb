#4.4 - Release 1: Interview with the Vampire 
puts "How many employees?"
employee = gets.chomp.to_i 
i = 1
while i <= employee
	puts "What is your name?"
	name = 'bob'#gets.chomp 

	puts "How old are you?"
	age = 4#gets.chomp.to_i 

	puts "What year were you born?"
	birth_year = 2013#gets.chomp.to_i
	real_age = 2016 - birth_year == age

	puts "Our company cafeteria serves garlic bread. Should we order some for you? (y/n)"
	garlic = 'n'#gets.chomp
		likes_garlic = garlic == 'y'

	puts "Would you like to enroll in the company’s health insurance? (y/n)"
	insurance = 'n'#gets.chomp 
		has_ins = insurance == "y"

	vamp_names = ['Drake Cula' , 'Tu Fang']
	is_vamp = "Results inconclusive"
		if real_age && (likes_garlic||has_ins)
			is_vamp = "Probably not a vampire"
		end
		if !(real_age && (likes_garlic || has_ins))
			is_vamp = "Probably a vampire"
		end
		if !real_age && !likes_garlic && !has_ins
			is_vamp = "Almost ceirtanly a vampire"
		end
		if vamp_names.include?(name)
    		is_vamp = "Definite a vampire"
		end

	loop do 
		puts "List an alergy, type 'done' to finish"
		alergy = gets.chomp

		case alergy
		when 'sunshine'
			is_vamp = "Probably a vampire"
			break
		when 'done'
			break
		end
	end
			
	puts "Thank you for responding. We conclude that you: #{is_vamp}"
	i = i + 1


end

puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends." 





