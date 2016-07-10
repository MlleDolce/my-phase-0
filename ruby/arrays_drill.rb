# Release 2

# At the top of your file, add a method that takes an array and an item as parameters, and returns the array with the item added. 
# So add_to_array([], "a") would return ["a"], and add_to_array(["a", "b", "c", 1, 2], 3) would return ["a", "b", "c", 1, 2, 3]. 
# Print a few test calls of the method.

def add_to_array(array, a)
	return array << a
end

p add_to_array(["parrot","dolphin","pineapple"], 7)
p add_to_array([false, true], "elephant")



# At the top of your file, add a method that takes three items as parameters and returns an array of those items. 
# So build_array(1, "two", nil) would return [1, "two", nil].
# This won't take much code, but the syntax might feel a bit odd.
# At the bottom of the file, call the method to show that it works.

def build_array(item1, item2, item3)
	new_array = Array.new
	return new_array.push("#{item1}", "#{item2}", "#{item3}")
end
p build_array("three", "four", "five")

# 1. Initialize an empty array and store it in a variable (you can choose the name). Print the variable using p.
My_Array = []
p My_Array

# 2. Add five items to your array. Print the array.
My_Array.push("orange", "apple", "pear", "grape", "china plates")
p My_Array

# 3. Delete the item at index 2. Print the array.
My_Array.delete_at(2)
p My_Array

#4. Insert a new item at index 2. Print the array.
My_Array.insert(2, "strawberry")
p My_Array

#5. Remove the first item of the array without having to refer to its index. Print the array.
My_Array.shift
p My_Array

#6. Ask the array whether it includes a certain item. 
# Print the result of this method call 
# (labeled so it prints as more than just an isolated boolean value without any context.)
My_Array.include?("grape")
p "Does my array include the element 'grape'? answer: #{My_Array.include?("grape")}"

#7. Initialize another array that already has a few items in it.
Another_Array = ["mom", "dad", "baby"]

#8. Add the two arrays together and store them in a new variable. Print the new array.
combined_arrays = (My_Array << Another_Array).flatten
p combined_arrays