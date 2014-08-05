# putting students into an array

students = [
	["Elliot Lewis", :august],
	"Ruben Kostucki",
	"Tatiana Soukiassian",
	"Albert Vallverdu",
	"Andy Gates",
	"Henry Stanley",
	"Vincent Koch",
	"Nick Roberts",	
	"Lovis Schultze",	
	"Spike Lindsey",
	"Marc Singh",
	"Faisal Aydarus",
	"Kevin Daniells",
	"Merve Silk",
	"Maya Driver",	
	"Ethel Ng",
	"Benjamin Tillett",
	"Michelle Ballard",
	"James McNeil",
	"Chris Oatley",	
	"Jerome Pratt",
	"Ruth Earle",
	"Javier Silverio",
	"Stephen Lloyd",
	"Leopold Kwok"
]

def print_header
	puts "The students of my cohort at Makers Academy"
	puts "-------------------------"
end

def print(names)
	names.each do |name|
		puts name
	end
end

def print_footer(names)
	puts "Overall, we have #{names.length} great students."
end

print_header
print(students)
print_footer(students)