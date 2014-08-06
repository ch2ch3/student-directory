def input_students
	puts "Please enter the details of the students."
	puts "To finish, just hit return twice."
	# create an empty array
	students = []
	# get the first name
	name = gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do
		# EXERCISE 8: asks for cohort
		puts "What cohort is #{name} in?"
		# EXERCISE 8: converts to symbol
		cohort = gets.chomp.to_sym
		# EXERCISE 8: reprompts user for input
		if cohort.empty?
			puts "Please enter a cohort, or press return to fill in the default value of August."
			cohort = gets.chomp.to_sym
			# EXERCISE 8: supplies a default value of August if the value is still empty
			if cohort.empty?
				cohort = :august
			end
		end

		# EXERCISE 6: additional field of country
		puts "What is #{name}'s country of birth?"
		country = gets.chomp

		# add the student hash to the array
		students << {:name => name, :cohort => cohort, :country => country}

		# EXERCISE 10: uses singular and plural form as appropriate
		if students.length  == 1
			puts "Now we have #{students.length} student. Enter another name."
		else
			puts "Now we have #{students.length} students. Enter another name."
		end
		#get another name from the user
		name = gets.chomp
	end
	# return array of students
	students
end

def print_header
	puts "The students of my cohort at Makers Academy"
	puts "==========================================="
end

def print(students)
	if students.length >= 1 # EXERCISE 13: only prints the list if there is at least 1 student
		students.each_with_index do |student, index| # EXERCISE 2: adds an index number before each student
			# EXERCISE 6: adds student country | EXERCISE 7: centers the output using the length of the header
			puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort) from #{student[:country]}".center(43)
		end
	else
		puts "There are not enough students to make a list :("
	end
end

def print_footer(students)
	# EXERCISE 10: uses singular and plural form as appropriate
	if students.length  == 1
		puts "Overall, we have #{students.length} great student."
	else
		puts "Overall, we have #{students.length} great students."
	end
end

# EXERCISE 1
#
# Alternative 1: Using print
# Use “print”, and add “\n” to the end of each line.
# However, we have defined “print” as something else so this will produce an error.
# We need to rename the “print(students)” function to something else, e.g. “show(students)”.
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
# def show(students)
#	m = 0
#	while m < students.length
#		puts "#{students[m][:name]} (#{students[m][:cohort]} cohort)".center(43)
#		m += 1
#	end
# end
#
# def show(students)
#	m = 0
#	until m == students.length
#		puts "#{students[m][:name]} (#{students[m][:cohort]} cohort)".center(43)
#		m += 1
#	end
# end

students = input_students
print_header
print(students)
print_footer(students)