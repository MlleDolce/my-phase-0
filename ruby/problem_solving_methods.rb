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

@fib_array = [0, 1]

def rec_fib(number)
	while @fib_array.length == number
		return @fib_array
		break
	end
	@fib_arr.push(@fib_arr.last + @fib_arr[@fib_arr.length - 2]) ## undefined method 'last'???
	rec_fib(number)
end

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
rec_fib(100)
