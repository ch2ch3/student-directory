require 'csv'

@students = []

def interactive_menu
	loop do
		print_menu
		process(STDIN.gets.chomp)
	end
end

def print_menu
	puts "Enter the menu number of the function you want to access."
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the list"
	puts "4. Load an existing list"
	puts "9. Exit"
end

def process(selection)		
	case selection
		when "1"
			input_students
		when "2"
			show_students
		when "3"
			save_students
		when "4"
			load_students
		when "9"
			exit
		else
			puts "Whaa? Try again."
	end
end

def input_students
	puts "Please enter the details of the students.\nTo finish, just hit return twice."
	# get the first name
	puts "What is this student's name?"
	# EXERCISE 11: uses delete in place of chomp
	@name = STDIN.gets.delete("\n")
	# while the name is not empty, repeat this code
	while !@name.empty? do
		input_cohort
		input_age

		puts "What is #{@name}'s favourite thing to do?"
		@hobby = STDIN.gets.chomp
		@hobby = "Secret" if @hobby.empty?

		puts "What is #{@name}'s country of birth?"
		@country = STDIN.gets.chomp
		@country = "Secret" if @country.empty?

		add_student

		puts "Now we have #{@students.length} #{plural("student")}. Enter another name, or press return to exit."

		# get another name from the user
		@name = STDIN.gets.chomp
	end
	# return array of students
	@students
end

def input_cohort
	# EXERCISE 8: asks for cohort
	puts "What cohort is #{@name} in?"
	# EXERCISE 8: converts to symbol
	@cohort = STDIN.gets.chomp.downcase.to_sym

	calendar = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]

	# EXERCISE 8: corrects for typos by reprompting user for input
	while !calendar.include?(@cohort) do
		puts "Oops! Enter a valid calendar month, or press return for the current month."
		@cohort = STDIN.gets.chomp.downcase.to_sym
		# EXERCISE 8: supplies a default value of August if the value is still empty
		@cohort = Time.new.strftime("%B").downcase.to_sym if @cohort.empty?
	end
end

def input_age
	# EXERCISE 6: additional fields
	puts "How old is #{@name}?"
	@age = STDIN.gets.chomp
	
	if @age.empty?
		@age = "Sensitive"
	else
		while @age.to_i < 18 || @age.to_i > 100
			# prevents the user from entering a string as age (if a string is entered, it is converted to 0)
			if @age.to_i == 0
				puts "Please enter a valid age."
				@age = STDIN.gets.chomp.to_i
			elsif @age.to_i < 18
				puts "Is #{@name} really that young?"
				@age = STDIN.gets.chomp.to_i
			elsif @age.to_i > 100
				puts "Is #{@name} really that old?"
				@age = STDIN.gets.chomp.to_i
			end
		end
	end
end

# EXTRA EXERCISE 4: method to add the student hash to the array
def add_student
	@students << { :name => @name, :cohort => @cohort, :age => @age, :hobby => @hobby, :country => @country }
	@students
end

def show_students
	print_header
	print_students_list
	print_footer
end

def print_header
	puts "Students at Makers Academy by cohort".center(70)
	70.times { print "=" }
	puts
	puts "Name | Cohort | Age | Hobby | Country\n".center(70)
end

def print_students_list
	# EXERCISE 9: sorts the students array by an element in the hashes
	@students.sort_by! { |student| student[:cohort] }

	if @students.length >= 1 # EXERCISE 13: only prints the list if there is at least 1 student
		@students.each_with_index do |student, index| # EXERCISE 2: adds an index number before each student
			# EXERCISE 6: adds student country | EXERCISE 7: centers the output using the length of the header
			puts "#{index+1}. #{student[:name].capitalize} | #{student[:cohort].capitalize} | #{student[:age]} | #{student[:hobby].capitalize} | #{student[:country].capitalize}".center(70)
		end
	else
		puts "Oops! You haven't entered any students yet.".center(70)
	end
end

# EXERCISE 10: uses singular and plural form as appropriate
def plural(word)
	if @students.length != 1
		word = word + "s"
	end
	word
end

def print_footer
	puts
	puts "Overall, we have #{@students.length} great #{plural("student")}.".center(70)
	puts
end

def save_students
	# EXTRA EXERCISE 7: prompts user for filename
	puts "Your file will be saved as [name].csv. What do you want to name your file?"
	filename = gets.chomp
	# EXTRA EXERCISE 6: uses CSV library
	# open the file for writing, w = permission to write
	CSV.open("#{filename}.csv", "w") do |csv|
		# iterate over the array of students to get each hash
		@students.each do |student|
			# for each hash, use the keys to get all the values and put it into an array
			student_data = [student[:name], student[:cohort], student[:age], student[:hobby], student[:country]]
			csv << student_data
		end
	end
end

def try_load_students
	filename = ARGV.first # first argument from the command line
	return if filename.nil? # get out of the method if filename not given
	if File.exists?(filename) # if it exists
		load_students(filename)
	else
		puts "Oops, #{filename} doesn't seem to exist."
		exit
	end
end

def load_students
	# EXTRA EXERCISE 7: prompts user for filename
	puts "What's the name of your file? (Leave out the file extension.)"
	filename = gets.chomp
	while !File.exists?("#{filename}.csv")
		puts "Oops, #{filename}.csv doesn't seem to exist. Try again."
		puts "If you want to go back to the menu, type \"menu\" and press return."
		filename = gets.chomp
		break if filename == "menu"
	end

	if File.exists?("#{filename}.csv")
		# EXTRA EXERCISE 6: uses CSV library
		CSV.foreach("#{filename}.csv") do |row|
			# row is already an array
			@name, @cohort, @age, @hobby, @country = row
			@cohort = @cohort.to_sym
			add_student
		end
		puts "Loaded #{@students.length} from #{filename}!"
	end
end

# EXTRA EXERCISE 3: prints name of currently executed file
puts "You are running #{File.basename($0)}."
try_load_students
interactive_menu

# EXERCISE 1
#
# Alternative 1: Using print
# Use “print”, and add “\n” to the end of each line.
# However, we have defined “print” as something else so this will produce an error.
# We need to rename the “print(students)” function to something else, e.g. “display(students)”.
#
# Alternative 2: Using p
# p will print the quotes with the message.

# EXERCISE 3
#
# def print(students)
# 	students.each_with_index do |student, index|
# 		if student[:name][0].downcase == "a"
#			# uses index+1 so that the list doesn't begin with 0
# 			puts "#{index+1} #{student[:name]} (#{student[:cohort]} cohort)"
# 		end
# 	end
# end

# EXERCISE 4
#
# def print(students)
# 	students.each_with_index do |student, index|
# 		if student[:name][0].downcase == "a"
# 			puts "#{index+1} #{student[:name]} (#{student[:cohort]} cohort)"
# 		end
# 	end
# end

# EXERCISE 5
# def display(students)
#	m = 0
#	while m < students.length
#		puts "#{students[m][:name]} (#{students[m][:cohort]} cohort)".center(43)
#		m += 1
#	end
# end
#
# def display(students)
#	m = 0
#	until m == students.length
#		puts "#{students[m][:name]} (#{students[m][:cohort]} cohort)".center(43)
#		m += 1
#	end
# end

# EXTRA EXERCISE 5
# 
# def load_students(filename = "students2.csv")
# 	File.open(filename, "r") do |f1|
# 		while line = f1.gets
# 			name, cohort, age, hobby, country = line.chomp.split(",")
# 			@students << { :name => name, :cohort => cohort, :age => age, :hobby => hobby, :country => country }
# 		end
# 	end
# end
# 
# def save_students
# 	File.open("students2.csv", "w") do |f2|
# 		@students.each do |student|
# 			student_data = [student[:name], student[:cohort], student[:age], student[:hobby], student[:country]]
# 			f2.puts student_data.join(",")
# 		end
# 	end
# end