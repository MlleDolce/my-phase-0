# Vampire-detection quiz

def vampire_questionaire	
	puts "What is your name?"
	user_name = gets.chomp.to_s
	if user_name == "Drake Cula" || user_name == "Tu Fang"
		definitely_vampire = true
	end
	puts "What year were you born?"
	birth_year = gets.chomp.to_i
	if birth_year <= 1936
		birth_category = "wrong age"
	else birth_year > 1936
		birth_category = "right age" 
	end
	puts "Our company serves garlic bread.  Should we order some for you? (y/n)"
	garlic_desire = gets.chomp.to_s
	puts "Would you like to enroll in the company's health insurance? (y/n)"
	health_insurance_interest = gets.chomp.to_s
	
	if (garlic_desire == "y" && health_insurance_interest == "n") || (garlic_desire == "n" && health_insurance_interest == "y")
		one_yes_and_one_no = true
	end
	
	unless definitely_vampire == true
		if birth_category == "right age" && (garlic_desire == "y" || health_insurance_interest == "y")
			puts "Probably not a vampire"
		elsif birth_category == "wrong age" && one_yes_and_one_no == true
			puts "Probably a vampire"
		elsif birth_category == "wrong age" && (garlic_desire == "n" && health_insurance_interest == "n")
			puts "Almost certainly a vampire"
		else
			puts "Results are inconclusive"
		end
	end
	
	if definitely_vampire == true
		puts "Definitely a vampire!"
	end
end

times_run = 1

puts "How many employees will be processed?"
processing_number = gets.chomp.to_i

while times_run <= processing_number
	puts "Survey number #{times_run} of #{processing_number}"
	puts vampire_questionaire
	times_run += 1
end