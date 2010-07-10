require File.dirname(__FILE__) + '/spec_helper'

describe WaterPark do
  before :each do
    @wp = WaterPark.new
  end
  
  it "should not be nil" do
    @wp.should_not be_nil
  end
  
  it "should have a price of 46 for an adult" do
    @wp.adult.price.should be(46)
  end
  
  it "should have a price of 40 for a child" do
    @wp.child.price.should be(40)
  end
end