# 08.03.16, Wednesday.  11:14pm

def search_array(integer_array, item)
	# search the array for the item.  
	# if array includes item, return the item's index.  Do not use 'index' method
	# .length and .each are permitted
	if integer_array.include?(item) == false
		return nil
	end

	i = -1
	integer_array.each do |num| 
		i += 1
		if num == item
			return i
		end
	end
end

# Release 1, version2: fibonacci series, with recursion

def fib1(number)
	if number < 2
		puts "Please try again with a number greater than 2"
	else
		rec_fib(number, [0,1])
	end
end

def rec_fib(number, fib_arr)
	until fib_arr.length == number
		fib_arr.push(fib_arr.last + fib_arr[fib_arr.length - 2]) 
		rec_fib(number, fib_arr)
	end
	fib_arr
end

# Release 1, version1: fibonacci series 

def fib(number)
	fib_arr = [0, 1]

	until fib_arr.length == number
		if number < 2
			puts "Please try again with a number greater than 2"
		else
			fib_arr.push(fib_arr.last + fib_arr[fib_arr.length - 2])
		end
	end
	fib_arr
end

# Release 2: bubble sort method
def sort(array)
	rec_sort(array,[])
end

def rec_sort(array, sorted)
	if array.length <= 0
		return sorted
	end

	unsorted = []
	smallest = array.pop

	array.each do |item|
		if item < smallest
			unsorted << smallest
			smallest = item
		else
			unsorted << item
		end
	end
	sorted << smallest
	rec_sort(unsorted, sorted)
end
		
	# returns an array of fibonacci terms

# Release 0: Implement a Simple Search
# Write a method that takes an array of integers and an integer to search for. T
# The method should return the index of the item, or nil if the integer is not present in the array. 
# Don't use built-in array methods like .index. You are allowed to use .length and .each.
arr = [33, 45, 3, 12]
p search_array(arr, 45)
p search_array(arr, 1)

# Release 1:Calculate Fibonacci Numbers
fib(2)
fib(7)
fib(10)
fib(100)

# Release 1.1: Calculate Fibonacci Numbers, recursively
#rec_fib(100)

# Release 2: Sort an Array.  Create a sort method.
# => Write pseudo-code for a bubble-sort (also called 'sinking-sort')method

# 1. Create a function that takes two lists as parameters: the 1st list is unsorted, the 2nd list is sorted
# 2. Remove a single item from the end of the unsorted list.  Name this variable 'smallest'.
# 3. Iterate through the list of items, comparing one item at a time to the item you just removed.
# 4. If any item in the iteration is smaller than the 'smallest', 
#    a.) Add 'smallest' to a list called unsorted
#    b.) update 'smallest' variable to equal the new smallest item.
# 5. If any item in the iteration is larger than the 'smallest', add it to a list called 'unsorted'
# 6. Once all of the items in the array are compared against the 'smallest' variable:
#    a.) add the updated 'smallest' variable to the 'sorted' list
# 6. Now take the unsorted array and the new smallest item.  Use these as parameters to repeat the code.
# 7. Create wrapper code for the function just created above.  Let the wrapper code take an array as a single parameter
# 8. Inside this wrapper code, call the function created above.  For the two parameters, list the array as the first parameter, and use 
#    and empty array as the 2nd parameter

puts(sort([2,16,4,9,1]))
puts(fib1(6))
