# putting students into an array

students = [
	"Elliot Lewis"
	"Ruben Kostucki"
	"Tatiana Soukiassian"
	"Albert Vallverdu"
	"Andy Gates"
	"Henry Stanley"
	"Vincent Koch"	
	"Nick Roberts"	
	"Lovis Schultze"	
	"Spike Lindsey"
	"Marc Singh"
	"Faisal Aydarus"
	"Kevin Daniells"
	"Merve Silk"
	"Maya Driver"	
	"Ethel Ng"
	"Benjamin Tillett"
	"Michelle Ballard"
	"James McNeil"
	"Chris Oatley"	
	"Jerome Pratt"
	"Ruth Earle"
	"Javier Silverio"	
	"Stephen Lloyd"
	"Leopold Kwok"
]

puts "The students of my cohort at Makers Academy"
puts "-------------------------"

students.each do |student|
	puts student
end

# finally, we print the total
puts "Overall, we have #{students.length} great students."