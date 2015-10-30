class Rover

	attr_reader :id
	attr_accessor :x, :y, :direction

	@@rovers = []
	@@id = 1

	def initialize(x = 0, y = 0, direction = "N")
		@x = x.to_i
		@y = y.to_i
		@direction = direction.to_s
		@id = @@id
		puts "Rover #{@@id}'s starting position is (#{@x}, #{@y}) and is facing #{@direction}. "
		@@id += 1
	end

	def self.create(x = 0, y = 0, direction = "N")
		new_rover = new(x, y, direction)
		@@rovers << new_rover
	end

	def self.all
		@@rovers
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