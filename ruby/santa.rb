class Santa

	def initialize
		puts "Initializing new Santa instance..."
	end

	def speak
		puts "Ho, ho, ho! Haaappy holidays!"
	end

	def eat_milk_and_cookies(cookie_type)
		puts "That was a good #{cookie_type}"
	end
end

Andrea = Santa.new

Andrea.speak
Andrea.eat_milk_and_cookies("chocolate chip")