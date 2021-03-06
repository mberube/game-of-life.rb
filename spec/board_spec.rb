require 'spec_helper'
require 'rspec'
require 'Board'
describe Board do
	before :each do
		@board = Board.new
	end
	it "will stay empty if it starts empty" do
		@board.step.live_cell_list.size.should == 0
	end

	it "will be empty it it starts with only one live cell" do 
		@board.with_live_cells([Position.new(0,0)]).step.live_cell_list.size.should == 0
	end
	
	it "will keep four cells alive in square position" do
		positions = [Position.new(0,0), Position.new(1,0), Position.new(0,1), Position.new(1,1)]
		 @board.with_live_cells(positions)

		 @board.step.live_cell_list.size.should == 4
		 @board.live_cell_list.should == positions

		 @board.step.live_cell_list.size.should == 4
		 @board.live_cell_list.should == positions
	end

	it "will keep four cells alive in square position outside of center" do
		positions = [Position.new(10,10), Position.new(11,10), Position.new(10,11), Position.new(11,11)]
		 @board.with_live_cells(positions)
		 @board.step.live_cell_list.size.should == 4
		 @board.live_cell_list.should == positions

		 @board.step.live_cell_list.size.should == 4
		 @board.live_cell_list.should == positions
	end

	it "will alternate three cells in I position" do
		 @board.with_live_cells([Position.new(0,0), Position.new(1,0), Position.new(-1,0)])

		 @board.step.live_cell_list.size.should == 3
		 @board.alive?(Position.new(0,0)).should == true
		 @board.alive?(Position.new(0,-1)).should == true
		 @board.alive?(Position.new(0,1)).should == true
		 @board.step.live_cell_list.size.should == 3
		 @board.alive?(Position.new(0,0)).should == true
		 @board.alive?(Position.new(1,0)).should == true
		 @board.alive?(Position.new(-1,0)).should == true
	end
end
