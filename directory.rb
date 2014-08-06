def input_students
	print "Please enter the names and cohorts of the students.\n"
	puts "To finish, just hit return twice."
	#create an empty array
	students = []
	#get the first name
	name = gets.chomp
	#while the name is not empty, repeat this code
	while !name.empty? do
		#add the student hash to the array
		puts "What cohort is #{name} in?"
		cohort = gets.chomp.to_sym
		if cohort.empty?
			puts "Please enter a cohort, or press return to fill in the default value of August."
			cohort = gets.chomp.to_sym
			if cohort.empty?
				cohort = :august
			end
		end

		puts "What is #{name}'s country of birth?"
		country = gets.chomp

		students << {:name => name, :cohort => cohort, :country => country}

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

def show(students)
	students.each_with_index do |student, index|
		puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort) from #{student[:country]}".center(43)
	end
end

=begin # rewritten with while
def show(students)
	m = 0
	while m < students.length
		puts "#{students[m][:name]} (#{students[m][:cohort]} cohort)".center(50)
		m += 1
	end
end
=end

=begin # rewritten with until
def show(students)
	m = 0
	until m == students.length
		puts "#{students[m][:name]} (#{students[m][:cohort]} cohort)".center(50)
		m += 1
	end
end
=end

=begin # prints if first letter is A
def print(students)
	students.each_with_index do |student, index|
		if student[:name][0].downcase == "a"
			puts "#{index+1} #{student[:name]} (#{student[:cohort]} cohort)"
		end
	end
end
=end

=begin # prints if name is less than 12 characters
def print(students)
	students.each_with_index do |student, index|
		if student[:name][0].downcase == "a"
			puts "#{index+1} #{student[:name]} (#{student[:cohort]} cohort)"
		end
	end
end
=end

def print_footer(students)
	if students.length  == 1
		puts "Overall, we have #{students.length} great student."
	else
		puts "Overall, we have #{students.length} great students."
	end
end

students = input_students
print_header

if students.length > 1
	show(students)
else
	print "There are not enough students so you don't get to see the list.\n\n"
end

print_footer(students)