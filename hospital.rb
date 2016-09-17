require 'byebug'
# Write your code here!
class HospitalController
	def initialize
		@prog_start = false
	end

	def start_programme

		if @prog_start == false
			@hospital = Hospital.new("Misty","River Hospital")
			employee1 = Employees.new("1","Soon Seng","32","Doctor","sengjai","12345")
			@hospital.add_employees(employee1)
			employee2 = Employees.new("2","Nancy","23","Nurse","nurse","12345")
			@hospital.add_employees(employee2)
		end

		@prog_start = true 

		puts "Welcome to #{@hospital.name} #{@hospital.address}"
		puts "-------------------------------"
		puts "Are you a patient or an employee?"
		puts "1: Employee"
		puts "2: Patient"
		response = gets.chomp until response == "1" || response == "2"
		if response == "1"
			employee_details()
		elsif response == "2" 
			patient_details()
		end
	end

	def employee_details()
		login = false
		puts "Hi there, welcome back"
		puts "Please enter your username"
		username = gets.chomp
		puts "Please enter your password"
		password = gets.chomp
		login = @hospital.authenticate(username,password)
		#hospital.to_s
		if login == "Username does not exist" || login == "Incorrect login"
			#exit
			p "Unsuccessful Login -AM"
		else
			puts login
			employee_options()
		end
	end

	def employee_options()
		puts "What would you like to do?"
		puts "Options:"
		puts "1. List Patients"
		puts "2. View Records"
		puts "3. Add Records"
		puts "4. Remove Records"
		response = gets.chomp
		if response == "1"
			puts "All patients in Misty Hospital"
			puts "------------------------------"
			puts "id".ljust(2) + " | " + "Name".ljust(10) + " | " + "Age".ljust(4) + " | " + "Height".ljust(6) + " | " + "Weight".ljust(6)
			@hospital.num_patients.each do |x|
				puts (x.id).to_s.ljust(2) + " | " + (x.name).to_s.ljust(10) + " | " + (x.age).to_s.ljust(4) + " | " + (x.height).to_s.ljust(6) + " | " + (x.weight).to_s.ljust(6)
			end
		elsif response == "2"
			puts "Insert user id you want to view"
			id = gets.chomp
			@hospital.view_records(id)
		end
	end

	def patient_details()
		puts "Hi there, we need some information"
		puts "Please fill up the details below"
		puts "Your name"
		name = gets.chomp
		puts "Your age"
		age = gets.chomp
		puts "Your height"
		height = gets.chomp
		puts "Your weight"
		weight = gets.chomp
		patient = Patient.new(@hospital.num_patients.length + 1,name,age,height,weight)
		@hospital.add_patient(patient)
		puts "Thank you, your details have been added, we shall bring you back to the first page now"
		start_programme()
	end
end

class Hospital
	attr_reader :name,:address, :num_patients, :employees
	def initialize(name,address)
		@name = name #name of hospital
		@address = address #address of hospital
		@num_patients = [] #number of patients
		@employees = [] #number of employees
		@answer = ""
	end

	def add_patient(patient)
		@num_patients << patient
	end

	def add_employees(employee)
		@employees << employee
	end

	def print_patient()
		p @num_patients.first.name
	end

	def authenticate(login_username,password)
		@employees.each do |x|
			#byebug
			if x.username == login_username
				#correct username
				if x.password == password
					#correct password
					return "Welcome #{x.name}, your access level is #{x.position}"		
				else
					p "Your password is incorrect, please insert the correct password"
					password = gets.chomp
					if x.password == password
						return "Welcome #{x.name}, your access level is #{x.position}"
					else
						return "Incorrect login"
					end
					#break; #break the loop or key in password again
				end
			else
					#loop again
			end
		end
		return "Username does not exist"
	end

	def view_records(patient_id)
		@num_patients.each do |x|
			byebug
			if x.id.to_s == patient_id
				puts (x.id).to_s.ljust(2) + " | " + (x.name).to_s.ljust(10) + " | " + (x.age).to_s.ljust(4) + " | " + (x.height).to_s.ljust(6) + " | " + (x.weight).to_s.ljust(6)
			end
		end
	end

	def to_s
		#p "#{@answer}"
	end
end

class Patient < Hospital
	attr_accessor :id, :name, :age, :height,:weight

	def initialize(id,name,age,height,weight)
		@id = id
		@name = name
		@age = age
		@height = height
		@weight = weight
	end
end

class Employees < Hospital
	attr_accessor :name, :age, :position, :username, :password
	def initialize(id, name, age, position, username, password)
		@id = id
		@name = name
		@age = age
		@position = position 
		@username = username
		@password = password
	end


end


hospital_prog = HospitalController.new
hospital_prog.start_programme()





# hospital.add_patient(patient)






