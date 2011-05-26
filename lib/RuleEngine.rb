require 'Position'
class RuleEngine
	def next_cell_live?(position, board)
		neighbors_count = find_live_neighbors_count(position, board)
		return board.alive?(position) if neighbors_count == 2
		neighbors_count == 3
	end

	def find_live_neighbors_count(position, board)
		count = 0
		neighbors = Neighborhood.new.neighbors([position])
		neighbors.each do |neighbor|
			count = count + 1 if board.alive?(neighbor)
		end
		count
	end
end
