class Plateau

	attr_reader :x, :y

	def initialize(x, y)
		@x = x.to_i
		@y = y.to_i
	end
end

class Rover

	attr_accessor :x, :y, :direction
	@@counter = 0

	def initialize(x = 0, y = 0, direction = "N")
		@x = x.to_i
		@y = y.to_i
		@direction = direction.to_s
		@@counter += 1
		puts "Rover #{@@counter}'s starting position is (#{@x}, #{@y}) and is facing #{@direction}. "
	end

	def receive_instructions
		puts "Instructions taken: M (Move 1 forward in current direction), \nL (turn left) or R (turn right). "
		puts "Enter M, L, R or a combination (e.g. MMLRM): "
		input = gets.chomp.to_s
		read_instructions(input)
	end

	def read_instructions(input)
		instructions = input.split("")
		print "#{instructions} "
		instructions.each do |instruction|
			if instruction == "L" || instruction == "R"
				turn(instruction)
			elsif instruction == "M"
				move(instruction)
			else
				puts "invalid input, please enter M, L or R to either move or turn left/right"
				receive_instructions
			end
		end
	end

	def turn(instruction)
		case
		when instruction == "L"
			if @direction == "N"
				@direction = "W"
			elsif @direction == "E"
				@direction = "N"
			elsif @direction == "S"
				@direction = "E"
			elsif @direction == "W"
				@direction = "S"
			end
		when instruction == "R"
			if @direction == "N"
				@direction = "E"
			elsif @direction == "E"
				@direction = "S"
			elsif @direction == "S"
				@direction = "W"
			elsif @direction == "W"
				@direction = "N"
			end
		end
	end

	def move(instruction)
		case
		when instruction == "M"
			if @direction == "N"
				@y += 1
			elsif @direction == "E"
				@x += 1
			elsif @direction == "S"
				@y -= 1
			elsif @direction == "W"
				@x -= 1
			end
		end
	end

	def rover_status
		puts "rover is located in coordinates (#{@x}, #{@y}) and is facing #{@direction}."
	end
end

class MissionControl

	def initialize()
	end

end

puts "Please enter plateau size."
print "First enter x coordinate, press enter and then enter y coordinate: "
plateau = Plateau.new(gets.chomp.to_i, gets.chomp.to_i)

rover1 = Rover.new
rover1.receive_instructions
rover1.rover_status

rover2 = Rover.new
rover2.receive_instructions
rover2.rover_status