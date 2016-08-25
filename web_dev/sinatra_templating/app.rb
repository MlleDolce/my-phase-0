
# require gems
require 'sinatra'
require 'sqlite3'

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("students.db")
db1 = SQLite3::Database.new("courses.db")
db.results_as_hash = true
db1.results_as_hash = true

# show students on the home page
get '/' do
  @students = db.execute("SELECT * FROM students")
  erb :home
end

get '/students/new' do
  erb :new_student
end

# create new students via
# a form
post '/students' do
  db.execute("INSERT INTO students (name, campus, age) VALUES (?,?,?)", [params['name'], params['campus'], params['age'].to_i])
  redirect '/'
end

# Release 1: Create a route for your new erb page
get '/students/courses' do
  erb :course_options
end

# Release 2: Build a Form.  Allow the user to add or manipulate data in some way using a form
post '/students/courses' do
	db1.execute("INSERT INTO course_suggestions (title) VALUES (?)", [params['title1']])
	db1.execute("INSERT INTO course_suggestions (title) VALUES (?)", [params['title2']])
	redirect '/students/courses/collection'
end

get '/students/courses/collection' do
	@courses = db1.execute("SELECT * FROM course_suggestions")
	erb :course_collection
end