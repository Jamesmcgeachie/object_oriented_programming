require_relative 'missioncontrol.rb'
require_relative 'rover.rb'
require_relative 'plateau.rb'

puts "Please enter plateau size."
print "First enter x coordinate, press enter and then enter y coordinate: "
plateau = Plateau.new(gets.chomp.to_i, gets.chomp.to_i)

base = MissionControl.new
puts "MissionControl, deploy a Rover?"
