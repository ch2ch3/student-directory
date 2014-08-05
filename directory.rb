# putting students into an array

students = [
	{:name => "Elliot Lewis", :cohort => :august},
	{:name => "Ruben Kostucki", :cohort => :august},
	{:name => "Tatiana Soukiassian", :cohort => :august},
	{:name => "Albert Vallverdu", :cohort => :august},
	{:name => "Andy Gates", :cohort => :august},
	{:name => "Henry Stanley", :cohort => :august},
	{:name => "Vincent Koch", :cohort => :august},
	{:name => "Nick Roberts", :cohort => :august},
	{:name => "Lovis Schultze", :cohort => :august},
	{:name => "Spike Lindsey", :cohort => :august},
	{:name => "Marc Singh", :cohort => :august},
	{:name => "Faisal Aydarus", :cohort => :august},
	{:name => "Kevin Daniells", :cohort => :august},
	{:name => "Merve Silk", :cohort => :august},
	{:name => "Maya Driver", :cohort => :august},
	{:name => "Ethel Ng", :cohort => :august},
	{:name => "Benjamin Tillett", :cohort => :august},
	{:name => "Michelle Ballard", :cohort => :august},
	{:name => "James McNeil", :cohort => :august},
	{:name => "Chris Oatley", :cohort => :august},
	{:name => "Jerome Pratt", :cohort => :august},
	{:name => "Ruth Earle", :cohort => :august},
	{:name => "Javier Silverio", :cohort => :august},
	{:name => "Stephen Lloyd", :cohort => :august},
	{:name => "Leopold Kwok", :cohort => :august}
]

def print_header
	puts "The students of my cohort at Makers Academy"
	puts "-------------------------"
end

def print(students)
	students.each do |student|
		puts "#{student[:name]} (#{student[:cohort] cohort)}"
	end
end

def print_footer(names)
	puts "Overall, we have #{names.length} great students."
end

print_header
print(students)
print_footer(students)