class Rover

	attr_accessor :x, :y, :direction

	def initialize(x, y, direction)
		@x = x.to_i
		@y = y.to_i
		@direction = direction.to_s
		puts "Rover's starting position is (#{@x}, #{@y}) and is facing #{@direction}. "
	end

	def input_prompt
		puts "Please enter instructions to rover. Can be M (Move 1 forward in current direction facing), \n L (turn left) or R (turn right). Can enter multiple instructions. "
		puts "Enter M, L, R or a combination (e.g. MMLRM): "
		input = gets.chomp.to_s
		read_instructions(input)
	end

	def read_instructions(input)
		instructions = input.split("")
		print "#{instructions} :"
		instructions.each do |instruction|
			if instruction == "L" || instruction == "R"
				turn(instruction)
			elsif instruction == "M"
				move(instruction)
			else
				puts "invalid input, please enter M, L or R to either move or turn left or right"
				input_prompt
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

rover1 = Rover.new(0, 0, "N")
rover1.input_prompt
rover1.rover_status

rover2 = Rover.new(0, 0, "S")
rover2.input_prompt
rover2.rover_status