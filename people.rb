class Person

	def initialize(name)
		@name = name
	end

	def greeting
		puts "Hi, my name is #{@name}"
	end
end

class Student < Person
	def learn
		puts "I get it!"
	end
end

class Instructor < Person
	def teach
		puts "Everything in Ruby is an Object"
	end
end

chris = Instructor.new("Chris")
chris.greeting
cristina = Student.new("Cristina")
cristina.greeting
chris.teach
cristina.learn
# The below does not work as the teach method is not available to the student class, only instructor
cristina.teach