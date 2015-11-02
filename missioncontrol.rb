require_relative 'rover.rb'
require_relative 'plateau.rb'

class MissionControl

	def self.create
		mission_control = new
		mission_control.main_menu
	end

	def print_main_menu
		puts "1. Deploy a Rover"
		puts "2. Choose a Rover to move"
		puts "3. Receive Rover's position"
		puts "4. Exit"
	end


	def main_menu
		while true
			print_main_menu
			print "Choose an option: "
			user_input = gets.chomp.to_i
			break if user_input == 4
			choose_option(user_input)
		end
	end


	def choose_option(input)
		case input
		when 1 then deploy_rover
		when 2 then choose_rover
		when 3 then check_position
		when 4 then exit
		else
			puts "Mission Control does not follow."
		end
	end

	def deploy_rover
		print "Enter Rover X coordinate: "
		x = gets.chomp.to_i
		print "Enter Rover Y coordinate: "
		y = gets.chomp.to_i
		print "Enter direction rover is facing. N, E, S or W: "
		direction = gets.chomp.to_s.upcase
		Rover.create(x, y, direction)
	end

	def choose_rover
		if Rover.all.count > 0
			Rover.all.each do |rover|
				puts "ID: #{rover.id} (#{rover.x}, #{rover.y}), facing #{rover.direction}"
			end
			print "Which rover do you wish to control? Enter ID Number: "
			rover_choice = gets.chomp.to_i
			receive_instructions(rover_choice)
		else
			puts "---"
			puts "No rovers deployed, please deploy rovers first before choosing one to move. "
			puts "---"
		end
	end

	def receive_instructions(rover_choice)
		puts "Instructions taken: M (Move 1 forward in current direction), \nL (turn left) or R (turn right). "
		puts "Enter M, L, R or a combination (e.g. MMLRM): "
		input = gets.chomp.to_s.upcase
		read_instructions(input, rover_choice)
	end

	def read_instructions(input, rover_choice)
		instructions = input.split("")
		print "#{instructions} "
		instructions.each do |instruction|
			if instruction == "L" || instruction == "R"
				Rover.turn(instruction, rover_choice)
			elsif instruction == "M"
				Rover.move(instruction, rover_choice)
			else
				puts "invalid input, please enter M, L or R to either move or turn left/right"
				receive_instructions(rover_choice)
			end
		end
		rover = Rover.find(rover_choice)
		puts "Rover's position is now (#{rover.x}, #{rover.y}), facing #{rover.direction}"
	end
end

