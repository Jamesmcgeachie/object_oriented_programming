require_relative 'rover.rb'

class MissionControl

	attr_accessor :rover, :rovers

	def initialize
		@rovers = Rover.all
	end

	def deploy_rover
		Rover.create
	end

	def self.receive_instructions(rover)
		puts "Instructions taken: M (Move 1 forward in current direction), \nL (turn left) or R (turn right). "
		puts "Enter M, L, R or a combination (e.g. MMLRM): "
		input = gets.chomp.to_s
		read_instructions(input, rover)
	end

	def read_instructions(input, rover)
		instructions = input.split("")
		print "#{instructions} "
		instructions.each do |instruction|
			if instruction == "L" || instruction == "R"
				rover.turn(instruction)
			elsif instruction == "M"
				rover.move(instruction)
			else
				puts "invalid input, please enter M, L or R to either move or turn left/right"
				MissionControl.receive_instructions(rover)
			end
		end
	end
end

