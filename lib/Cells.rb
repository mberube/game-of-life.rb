class Cells
	def initialize
		@cells = {}
	end

	def live(position)
		@cells[position] = true
	end

	def live?(position)
		@cells[position] || false
	end

	def list
		@cells.collect {|key,value|key}
	end
end
