# The Hash Class

# 1. How do you delete a key pair?
h.delete("a")

# 2.  What happens if you try to access the value of a key that's not in the hash?
returns "nil"

# 3.  Regarding the answer you got from the previous question, is there a way to set a different default return value when a key is not present in a hash?
# Yes.  You can set a new default by either:
#a.) sending it as an argument to new. eg:
grades = Hash.new(0), or
#b.) 
grades.default = 0

# 4.  How can you access just the keys of a hash? What data type does this method return?
h.keys
#This will return a new array populated with the keys of the hash.  Strings

# 5. How do you remove everything from the hash at once (returning an empty hash)?
h.clear

# 6. How can you access just the values of a hash?  
h.values
# This will return a new array populated with the values of the hash.