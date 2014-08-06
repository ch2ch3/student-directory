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
		cohort = gets.chomp.downcase.to_sym
		# EXERCISE 8: reprompts user for input
		calendar = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
		
		# EXERCISE 8: corrects for typos
		while !calendar.include?(cohort) do
			puts "Please enter a valid calendar month, or press return for a default value of August."
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
		while height == 0
			puts "Please enter a valid number."
			height = gets.chomp.to_i
		end

		# add the student hash to the array
		students << {	:name => name,
						:cohort => cohort,
						:hobby => hobby,
						:country => country,
						:height => height
					}

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
	puts "Students at Makers Academy by cohort".center(70)
	70.times { print "=" }
	puts
	puts "Name | Cohort | Hobby | Country | Height\n".center(70)
end

def display_by_cohort(students)
	# EXERCISE 9: sorts the students array by an element in the hashes
	students.sort_by! { |s| s[:cohort] }

	if students.length >= 1 # EXERCISE 13: only prints the list if there is at least 1 student
		students.each_with_index do |student, index| # EXERCISE 2: adds an index number before each student
			# EXERCISE 6: adds student country | EXERCISE 7: centers the output using the length of the header
			puts "#{index+1}. #{student[:name].capitalize} | #{student[:cohort].capitalize} | #{student[:hobby].capitalize} | #{student[:country].capitalize} | #{student[:height]}".center(70)
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

students = input_students
print_header
display_by_cohort(students)
print_footer(students)