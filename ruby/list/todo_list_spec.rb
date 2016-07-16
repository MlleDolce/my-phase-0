# 6.6 Release 3: Write a Class to Satisfy Tests

# In phase-0-tracks/ruby/list, you'll find a test file for a TodoList class. 
# The class itself isn't anything fancy -- it basically maintains an internal array attribute 
# and provides methods that allow the array to be accessed and updated in various ways.

# Run the tests. Resolve any errors you see and add code that will make all of the tests pass. 
# Work on one test at a time until you've made it all the way to "green" (all tests passing).

#--------------

# 7/14/16
# 11:26am: pre-test 1.  "Uninitialized constant TodoList"
# add require_relative TodoList' and create class TodoList in separate file that takes one argument
# 11:32am: create an initialize method with an empty internal array attribute called 'list'.
# [rabbit hole 1: trying to set up incorrect argument for initialize.... ]
# 11:46am: pre-test 2.  Does TodoList initialize?  YES!  check.  first successful 'fail' without syntax errors.
# 11:47am: Troubleshoot test 1.  Create method'get_items' to store the list items in an array.
# 11:52am: Test 1, take 1: does it store the list items on initialization?  No.  Incorrect number of arguments
#  give initialize a single argument that takes an array.  
# [rabbit hole 2: how to get initialize argument to appear in get_items?  
# 12:28: Test 1, take 2: Success!  but very redundant method.  More efficient way?
# 12:30: Test 2, take 1.  Create add_item method.  Success.  piece of cake.
# 12:31: Test 3, take 1.  Create delete_item method.  Success.
# 12:33: Test 4, take 1.  Refactor get_items method to retrieve item by index.  Need to create index parameter.
# 12:37: Test 4, take 2.  Oops.  KEEP get_items method from test two.  Create a new get_item method.
# 12:38pm: SUCCESS!  All 4 tests, pass.


require_relative 'TodoList'

describe TodoList do
  let(:list) { TodoList.new(["do the dishes", "mow the lawn"]) }

  it "stores the list items given on initialization" do
    expect(list.get_items).to eq ["do the dishes", "mow the lawn"]
  end

  it "adds an item to the list" do
    list.add_item("mop")
    expect(list.get_items).to eq ["do the dishes", "mow the lawn", "mop"]
  end

  it "deletes an item" do
    list.delete_item("do the dishes")
    expect(list.get_items).to eq ["mow the lawn"]
  end

  it "retrieves an item by index" do
    expect(list.get_item(0)).to eq "do the dishes"
  end
end