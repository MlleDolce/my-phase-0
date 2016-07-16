#Q2
def calculate(int1, operator, int2)
  case operator
  when '-'
    int1 - int2
  when '+'
    int1 + int2
  when '*'
    int1 * int2
  when '/'
    int1 / int2
  end
end

# p calculate(3, '+', 2) == 5
# p calculate(3, '-', 2) == 1
# p calculate(3, '*', 2) == 6
# p calculate(6, '/', 2) == 3

#Q3 + Q4 + Q5
def display_calculations(calculations)
  puts "#{calculations.length} calculations performed:"
  calculations.each do |input, answer|
    puts "#{input} = #{answer}"
  end
end

calculations = {}

loop do
  puts "What calculation would you like to do?\nFormat: 'number symbol number' or 'done' to exit."
  input = gets.chomp

  if input == 'done'
    display_calculations(calculations)
    break
  end

  input_values = input.split(' ')
  first_number = input_values[0].to_i
  second_number = input_values[2].to_i
  symbol = input_values[1]

  answer = calculate(first_number, symbol, second_number)

  puts answer
  calculations[input] = answer
end

#Q6 Bonus
def calculate_2(int1, operator, int2)
  raise 'first and last arguements must be integers' if !(int1.is_a?(Integer) && int2.is_a?(Integer))
  case operator
  when '-'
    int1 - int2
  when '+'
    int1 + int2
  when '*'
    int1 * int2
  when '/'
    int1 / int2
  else
    raise "#{operator} is not recognized."
  end
end
