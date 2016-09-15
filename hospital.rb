# Write your code here!
class Hospital
	attr_reader :name,:address
	
	def initialize(name,address)
		@name = name #name of hospital
		@address = address #address of hospital
		@num_patients = [] #number of patients
		@employees = employees #number of employees
	end

	def add_patient(patient)
		@num_patients << patient
	end

	def print_patient()
		p @num_patients.first.name
	end

	def authenticate(login_username)
		# @patients.each do |x|
		# 	if login_username == x.name
		# 		puts "Successful Login"
		# 	else
		# 		puts "Invalid Login"
		# 	end
		# end
		#This is to check the username from gets.chomp
	end
end

class Patient < Hospital
	attr_accessor :name, :age, :height,:weight

	def initialize(name,age,height,weight)
		@name = name
		@age = age
		@height = height
		@weight = weight
	end
end

class Employees < Hospital
	attr_accessor :name, :age, :position
	def initialize(name, age, position)
		@name = ""
		@age = 0
		@position = "" 
	end
end

class Doctor < Employees

	def initialize
		super
	end
end

hospital = Hospital.new("River Hospital","Misty")

puts "Welcome to #{hospital.name} #{hospital.address}"
puts "-------------------------------"
puts "Please fill up the details below"


patient = Patient.new(name,age,height,weight)

hospital.add_patient(patient)
hospital.print_patient






