require 'spec_helper'
require 'rspec'
require 'Neighborhood'
describe Neighborhood do
	before :each do
		@neighborhood = Neighborhood.new
	end

	it "returns empty list if no cell given" do
		@neighborhood.neighbors([]).size.should == 0
	end

	it "returns neighbors for one cell" do
		@neighborhood.neighbors([Position.new(0,0)]).size.should == 8
	end

	it "returns neighbors for two separate cells" do
		@neighborhood.neighbors([Position.new(0,0), Position.new(10,10)]).size.should == 16
	end

	it "returns neighbors for two neighbor cells" do
		@neighborhood.neighbors([Position.new(0,0), Position.new(1,0)]).size.should == 10
	end
end
