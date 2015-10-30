class Good

	attr_reader :tax, :price, :sales_tax

	def initialize(name, price)
		@name = name.to_s
		@price = price.to_f
		@sales_tax = 0
	end

	def calculate_tax
		@sales_tax = @price * 0.10
	end
end

class ExemptGood
end

class ImportGood
end

class ShoppingCart

	attr_reader :goods

	def initialize(*goods)
		@goods = 0
		@goods << goods
	end

end
