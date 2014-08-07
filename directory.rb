@students = []

def interactive_menu
	loop do
		print_menu
		process(gets.chomp)
	end
end

def print_menu
	puts "Enter the menu number of the function you want to access."
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the list to a students.csv file"
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
		when "9"
			exit
		else
			puts "Whaa? Try again."
	end
end

def input_students
	puts "Please enter the details of the students."
	puts "To finish, just hit return twice."
	# get the first name
	puts "What is this student's name?"
	# EXERCISE 11: uses chop in place of chomp
	name = gets.chop
	# while the name is not empty, repeat this code
	while !name.empty? do
		# EXERCISE 8: asks for cohort
		puts "What cohort is #{name} in?"
		# EXERCISE 8: converts to symbol
		cohort = gets.chomp.downcase.to_sym
		# EXERCISE 8: reprompts user for input
		calendar = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
		
		# EXERCISE 8: corrects for typos
		while !calendar.include?(cohort) do
			puts "Oops! Enter a valid calendar month, or press return for a default value of August."
			cohort = gets.chomp.downcase.to_sym
			# EXERCISE 8: supplies a default value of August if the value is still empty
			if cohort.empty?
				cohort = :august
			end
		end

		# EXERCISE 6: additional fields
		puts "What is #{name}'s favourite thing to do?"
		hobby = gets.chomp

		puts "What is #{name}'s country of birth?"
		country = gets.chomp

		puts "How tall is #{name} (in cm)?"
		height = gets.chomp.to_i

		# prevents the user from entering a string as height (if a string is entered, it is converted to 0)
		while height < 120
			puts "Oops! Please enter a valid number."
			height = gets.chomp.to_i
		end

		# add the student hash to the array
		@students << {
						:name => name,
						:cohort => cohort,
						:hobby => hobby,
						:country => country,
						:height => height
					}

		# EXERCISE 10: uses singular and plural form as appropriate
		if @students.length == 1
			puts "Now we have #{@students.length} student. Enter another name, or press return to exit."
		else
			puts "Now we have #{@students.length} students. Enter another name, or press return to exit."
		end
		#get another name from the user
		name = gets.chomp
	end
	# return array of students
	@students
end

def save_students
	# open the file for writing, w = permission to write
	file = File.open("students.csv", "w")
	# iterate over the array of students to get each hash
	@students.each do |student|
		# for each hash, use the keys to get all the values and put it into an array
		student_data = [student[:name], student[:cohort], student[:hobby], student[:country], student[:height]]
		# joins the individual student array into a single string separated with commas
		csv_line = student_data.join(",")
		# puts the string into the file
		file.puts csv_line
	end
	file.close
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
	puts "Name | Cohort | Hobby | Country | Height (cm)\n".center(70)
end

def print_students_list
	# EXERCISE 9: sorts the students array by an element in the hashes
	@students.sort_by! { |s| s[:cohort] }

	if @students.length >= 1 # EXERCISE 13: only prints the list if there is at least 1 student
		@students.each_with_index do |student, index| # EXERCISE 2: adds an index number before each student
			# EXERCISE 6: adds student country | EXERCISE 7: centers the output using the length of the header
			puts "#{index+1}. #{student[:name].capitalize} | #{student[:cohort].capitalize} | #{student[:hobby].capitalize} | #{student[:country].capitalize} | #{student[:height]}".center(70)
		end
	else
		puts "Oops! You haven't entered any students yet.".center(70)
	end
end

def print_footer
	puts
	# EXERCISE 10: uses singular and plural form as appropriate
	if @students.length == 1
		puts "Overall, we have #{@students.length} great student.".center(70)
	else
		puts "Overall, we have #{@students.length} great students.".center(70)
	end
	puts
end

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