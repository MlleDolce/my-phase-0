# Vampire-detection quiz

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
	mixed_answer = true
end

unless definitely_vampire == true
	if birth_category == "right age" && (garlic_desire == "y" || health_insurance_interest == "y")
		puts "Probably not a vampire"
	elsif birth_category == "wrong age" && mixed_answer == true
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
