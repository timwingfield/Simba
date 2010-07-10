require File.dirname(__FILE__) + '/spec_helper'

describe AnnualPass do
  before :each do
    @ap = AnnualPass.new
  end
  
  it "should not be nil" do
    @ap.should_not be_nil
  end
  
  it "should return false for is_dvc" do
    @ap.is_dvc.should be_false
  end
  
  it "should return false for is_premium" do
    @ap.is_premium.should be_false
  end
  
  describe "and getting adult prices" do
    it "should have a regular price of 489" do
      @ap.adult.price.should be(489)
    end
    
    it "should have a premium price of 619" do
      @ap.adult.premium.price.should be(619)
    end
    
    it "should have a regular dvc price of 389" do
      @ap.adult.dvc.price.should be(389)
    end
    
    it "should have a premium dvc price of 494" do
      @ap.adult.dvc.premium.price.should be(494)
    end
  end
  
  describe "and getting child prices" do
    it "should have a regular price of 432" do
      @ap.child.price.should be(432)
    end
    
    it "should have a premium price of 546" do
      @ap.child.premium.price.should be(546)
    end
    
    it "should have a regular dvc price of 344" do
      @ap.child.dvc.price.should be(344)
    end
    
    it "should have a premium dvc price of 436" do
      @ap.child.premium.dvc.price.should be(436)
    end
  end
end