# The Even Number Detector

# This method counts to n from 0,
# shouting out even numbers
# along the way.

def even_number_detector(n)
	current_number = 0
	
	while current_number < n
	  puts current_number
	  current_number += 2
	end
end

puts even_number_detector(16)