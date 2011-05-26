require 'rspec'
require 'RuleEngine'
describe RuleEngine do
	before :each do
		@engine = RuleEngine.new
		@board = Board.new
	end

	it "will keep dead cells dead" do
		position = Position.new(0,0)
		@engine.next_cell_live?(position, @board).should == false
	end

	it "will kill cells with no neighbors" do
		position = Position.new(0,0)
		@board.with_live_cells([position])
		@engine.next_cell_live?(position, @board).should == false
	end

	it "will kill cells with 1 neighbors" do
		position = Position.new(0,0)
		@board.with_live_cells([position, Position.new(0, 1)])
		@engine.next_cell_live?(position, @board).should == false
	end

	it "will keep cells with 2 neighbors alive" do
		position = Position.new(0,0)
		@board.with_live_cells([position, Position.new(0, 1), Position.new(1,0)])
		@engine.next_cell_live?(position, @board).should == true
	end

	it "will keep dead cells with 2 neighbors dead" do
		position = Position.new(0,0)
		@board.with_live_cells([Position.new(0, 1), Position.new(1,0)])
		@engine.next_cell_live?(position, @board).should == false
	end

	it "will revive dead cells with 3 neighbors" do
		position = Position.new(0,0)
		@board.with_live_cells([Position.new(0, 1), Position.new(1,0), Position.new(1,1)])
		@engine.next_cell_live?(position, @board).should == true
	end

	it "will kill cells with 4 neighbors" do
		position = Position.new(0,0)
		@board.with_live_cells([Position.new(0, 1), Position.new(1,0), Position.new(1,1), Position.new(-1,0)])
		@engine.next_cell_live?(position, @board).should == false
	end

	it "will kill cells with 5 neighbors" do
		position = Position.new(0,0)
		@board.with_live_cells([Position.new(0, 1), Position.new(1,0), Position.new(1,1), Position.new(-1,0), Position.new(0,-1)])
		@engine.next_cell_live?(position, @board).should == false
	end
end
