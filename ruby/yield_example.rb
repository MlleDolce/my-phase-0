def say_hello
  name1 = "Steve"
  name2 = "Tiahna"
  puts "Why, hello there!"
  yield(name1, name2)
end

say_hello { |name1, name2| puts "Great to see you, #{name1} and #{name2}!" }