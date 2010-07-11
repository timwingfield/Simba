require File.dirname(__FILE__) + '/spec_helper'

describe TicketWizard do
  before :each do
    @tw = TicketWizard.new
  end
  
  it "should not be nil" do
    @tw.should_not be_nil
  end
  
  it "should initialize to 0 days" do
    @tw.days.should be(0)
  end
  
  it "should initialize water park visits to 0" do
    @tw.water_park_visits.should be(0)
  end
  
  it "should initialize park hopping to false" do
    @tw.park_hopping.should be_false
  end
  
  it "should initialize dvc member to false" do
    @tw.dvc_member.should be_false
  end
  
  it "should initialize 1 magic your way adult ticket" do
    @tw.myw_adult.should_not be_nil
  end
  
  it "should initialize 1 magic your way child ticket" do
    @tw.myw_child.should_not be_nil
  end
  
  it "should initialize 1 adult annual pass" do
    @tw.ap_adult.should_not be_nil
  end
  
  it "should initialize 1 child annual pass" do
    @tw.ap_child.should_not be_nil
  end
  
  describe "when visiting one day" do
    before :each do
      @tw.days = 1
      @tw.calculate_tickets
    end
    
    it "should have a myw adult price of 79" do
      @tw.myw_adult.price.should be(79)
    end
    
    it "should have a myw child price of 68" do
      @tw.myw_child.price.should be(68)
    end
    
    it "should have an adult ap price of 489" do
      @tw.ap_adult.price.should be(489)
    end
    
    it "should have a child ap price of 432" do
      @tw.ap_child.price.should be(432)
    end
  end
  
  describe "when visiting 7 days and park hopping" do
    before :each do
      @tw.days = 7
      @tw.park_hopping = true
      @tw.calculate_tickets
    end
    
    it "should have an adult myw price of 286" do
      @tw.myw_adult.price.should be(286)
    end
    
    it "should have an child myw price of 253" do
      @tw.myw_child.price.should be(253)
    end
  
    it "should have an adult ap price of 489" do
      @tw.ap_adult.price.should be(489)
    end
  
    it "should have a child ap price of 432" do
      @tw.ap_child.price.should be(432)
    end    
  end
end