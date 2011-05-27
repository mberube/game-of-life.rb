require 'RuleEngine'
require 'Cells'
class Board
	def initialize
		@live_cells = Cells.new
	end

	def with_live_cells(cell_positions)
		cell_positions.each do |pos|
			@live_cells.live(pos)
		end
		self
	end

	def step
		next_state = Cells.new
		rule_engine = RuleEngine.new

		neighbors = Neighborhood.new.neighbors(live_cell_list)

		(live_cell_list+neighbors).each do |position, value|
			next_state.live(position) if rule_engine.cell_will_live?(position, self)
		end

		@live_cells = next_state
		self
	end

	def alive?(position)
		@live_cells.live?(position)
	end

	def live_cell_list
		@live_cells.list
	end
end
