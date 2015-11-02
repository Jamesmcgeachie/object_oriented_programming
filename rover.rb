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
		@@id += 1
	end

	def self.create(x = 0, y = 0, direction = "N")
		new_rover = new(x, y, direction)
		@@rovers << new_rover
		puts "Rover deployed at (#{x}, #{y}) and is facing #{direction}"
	end

	def self.all
		@@rovers
	end

	def self.turn(instruction, id)
		rover = find(id)
		case
		when instruction == "L"
			if rover.direction == "N"
				rover.direction = "W"
			elsif rover.direction == "E"
				rover.direction = "N"
			elsif rover.direction == "S"
				rover.direction = "E"
			elsif rover.direction == "W"
				rover.direction = "S"
			end
		when instruction == "R"
			if rover.direction == "N"
				rover.direction = "E"
			elsif rover.direction == "E"
				rover.direction = "S"
			elsif rover.direction == "S"
				rover.direction = "W"
			elsif rover.direction == "W"
				rover.direction = "N"
			end
		end
	end

	def self.move(instruction, id)
		rover = find(id)
		case
		when instruction == "M"
			if rover.direction == "N"
				rover.y += 1
			elsif rover.direction == "E"
				rover.x += 1
			elsif rover.direction == "S"
				rover.y -= 1
			elsif rover.direction == "W"
				rover.x -= 1
			end
		end
	end

	def self.find(id)
		@@rovers.each do |rover|
			if rover.id == id
				return rover
			end
		end
		return nil
	end
end