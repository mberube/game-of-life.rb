class Position
	attr_reader :row, :col
	def initialize(row, col)
		@row = row
		@col = col
	end

	def eql?(other)
		row == other.row && col == other.col
	end

	def hash
		row.hash + col.hash
	end
end
