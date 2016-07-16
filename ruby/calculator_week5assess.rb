User_Calc_Hash = Hash.new

index = 0
loop do
	puts "\nWhat calculation would you like to perform? Use operators +,-,*,/?"  
	puts "Place a space between each item. eg '3 + 5'"
	puts "Type 'done' to exit program."
	user_formula = gets.chomp.to_s

		if user_formula.include?('done')
			puts "#{index} calculations were performed"
			User_Calc_Hash.each {|formula, answer| puts "#{formula} = #{answer}"}
			puts "Thanks for inputting your formulas!  Goodbye"
			exit
		end

	if user_formula.split.length == 3 && user_formula.split[1].is_a?(Integer) == false

		user_formula.split.length
		int1 = user_formula.split[0].to_i
		op = user_formula.split[1].to_sym
		int2 = user_formula.split[2].to_i
		
		def calculate(a, b, c)
			b.to_sym
			return a.send(b,c)
		end

		puts "#{user_formula} is #{calculate(int1, op, int2)}"
		User_Calc_Hash[user_formula] = calculate(int1, op, int2)

	elsif user_formula.split.length < 3
		puts "\nYour array is too short.  Make sure you put spaces ' ' in between the elements of your formula."
	else	
		puts "\nYour calculation is invalid.  Please try again.  Your formula must have two integers with a valid operation in between them."
	end

	index += 1
end


#p calculate(7,'+',9)
#p calculate(1,'-',8)
#p calculate(2,'*',4)
#p calculate(3,'/',3)
