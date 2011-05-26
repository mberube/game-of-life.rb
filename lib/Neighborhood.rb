class Neighborhood
	def neighbors(positions)
		neighbors = []
		positions.each do |pos|
			neighbors << Position.new(pos.row+1, pos.col+1)
			neighbors << Position.new(pos.row+1, pos.col)
			neighbors << Position.new(pos.row+1, pos.col-1)
			neighbors << Position.new(pos.row-1, pos.col+1)
			neighbors << Position.new(pos.row-1, pos.col)
			neighbors << Position.new(pos.row-1, pos.col-1)
			neighbors << Position.new(pos.row, pos.col+1)
			neighbors << Position.new(pos.row, pos.col-1)

		end
		neighbors.uniq - positions
	end
end
