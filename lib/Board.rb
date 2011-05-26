require 'RuleEngine'
class Board
	def initialize
		@live_cells = {}
	end

	def with_live_cells(cell_positions)
		cell_positions.each do |pos|
			@live_cells[pos] = true
		end
		self
	end

	def step
		next_state = {}
		rule_engine = RuleEngine.new

		neighbors = Neighborhood.new.neighbors(live_cell_list)

		(live_cell_list+neighbors).each do |key, value|
			next_state[key] = true if rule_engine.next_cell_live?(key, self)
		end

		@live_cells = next_state
		self
	end

	def live_cell_count
		@live_cells.size
	end

	def alive?(position)
		@live_cells[position] || false
	end

	def live_cell_list
		@live_cells.collect {|key,value|key}

	end
end
