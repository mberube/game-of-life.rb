require 'rspec'
require 'RuleEngine'
describe RuleEngine do
	before :each do
		@engine = RuleEngine.new
		@board = Board.new
	end

	it "will keep cells with 2 neighbors alive" do
		position = Position.new(0,0)
		@board.with_live_cells([position] + get_neighbors(position, 2))
		@engine.cell_will_live?(position, @board).should == true
	end

	it "will keep dead cells with 2 neighbors dead" do
		position = Position.new(0,0)
		@board.with_live_cells(get_neighbors(position, 2))
		@engine.cell_will_live?(position, @board).should == false
	end

	it "will revive dead cells with 3 neighbors" do
		position = Position.new(0,0)
		@board.with_live_cells(get_neighbors(position, 3))
		@engine.cell_will_live?(position, @board).should == true
	end

	it "will keep live cells with 3 neighbors alive" do
		position = Position.new(0,0)
		@board.with_live_cells([position] + get_neighbors(position, 3))
		@engine.cell_will_live?(position, @board).should == true
	end

	([0, 1]+(4..8).to_a).each do |cell_count|
		it "will kill cells with #{cell_count} neighbors" do
			position = Position.new(0,0)
			@board.with_live_cells([position] + get_neighbors(position, cell_count))
			@engine.cell_will_live?(position, @board).should == false
		end

		it "will keep cells with #{cell_count} neighbors dead" do
			position = Position.new(0,0)
			@board.with_live_cells(get_neighbors(position, cell_count))
			@engine.cell_will_live?(position, @board).should == false
		end
	end

private
	def get_neighbors(position, count)
		neighbors = []

		neighbors << Position.new(1, -1) if(count >= 1)
		neighbors << Position.new(1, 0) if(count >= 2)
		neighbors << Position.new(1, 1) if(count >= 3)
		neighbors << Position.new(0, -1) if(count >= 4)
		neighbors << Position.new(0, 1) if(count >= 5)
		neighbors << Position.new(-1, -1) if(count >= 6)
		neighbors << Position.new(-1, 0) if(count >= 7)
		neighbors << Position.new(-1, 1) if(count >= 8)

		neighbors
	end
end
