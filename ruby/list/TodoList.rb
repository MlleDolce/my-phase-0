class TodoList
	def initialize(two_item_array)
		puts "Initializing instance of TodoList..."
		@list = two_item_array
	end

	def get_items
		@list
	end

	def add_item(item)
		@list.push(item)
	end

	def delete_item(item)
		@list.delete(item)
	end

	def get_item(index)
		@list[0]
	end
end