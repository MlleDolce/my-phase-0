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