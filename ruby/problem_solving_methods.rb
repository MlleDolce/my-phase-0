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

arr = [33, 45, 3, 12]
p search_array(arr, 45)
p search_array(arr, 1)