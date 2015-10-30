require_relative 'rover.rb'

class MissionControl

	attr_accessor :rover, :rovers

	def initialize
		@rovers = Rover.all
	end

	def deploy_rover
		Rover.create
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
end

