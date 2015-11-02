class Plateau

	attr_reader :x, :y

	def initialize(x, y)
		@@x = x.to_i
		@@y = y.to_i
	end

	def self.create
		print "Enter plateau size x coordinate: "
		x = gets.chomp.to_i
		print "Enter plateau size y coordinate: "
		y = gets.chomp.to_i
		new(x, y)
		puts "Plateau created with the size #{x} and #{y}"
		puts "---"
	end

	def self.size
	end

end