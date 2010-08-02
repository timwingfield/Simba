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
  
  it "should initialize mya water park tickets needed to 0" do
    @tw.myw_water_park_tickets_needed.should be(0)
  end
  
  it "should initialize ap water park tickets needed to 0" do
    @tw.ap_water_park_tickets_needed.should be(0)    
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
  
  describe "when visiting 5 days and visiting water parks twice" do
    before :each do
      @tw.days = 5
      @tw.water_park_visits = 2
      @tw.calculate_tickets
    end

    it "should have an adult myw price of 280" do
      @tw.myw_adult.price.should be(280)
    end

    it "should have a child myw price of 247" do
      @tw.myw_child.price.should be(247)
    end
    
    it "should have an myw water park tickets needed count of 0" do
      @tw.myw_water_park_tickets_needed.should be(0)
    end
    
    it "should have an ap water park tickets needed count of 2" do
      @tw.ap_water_park_tickets_needed.should be(2)
    end

    it "should have an adult ap price of 489" do
      @tw.ap_adult.price.should be(489)
    end

    it "should have a child ap price of 432" do
      @tw.ap_child.price.should be(432)
    end
  end
  
  describe "when visiting for 10 days, park hopping, and visiting water parks 3 times" do
    before :each do
      @tw.days = 10
      @tw.water_park_visits = 3
      @tw.park_hopping = true
      @tw.calculate_tickets
    end
    
    it "should have an adult myw price of 347" do
      @tw.myw_adult.price.should be(347)
    end
    
    it "should have a child myw price of 314" do
      @tw.myw_child.price.should be(314)
    end
    
    it "should have an adult annual pass price of 619" do
      @tw.ap_adult.price.should be(619)
    end
    
    it "should have a child annual pass price of 546" do
      @tw.ap_child.price.should be(546)
    end
    
    it "should have a premium adult annual pass" do
      @tw.ap_adult.is_premium.should be_true
    end
    
    it "should have a premium child annual pass" do
      @tw.ap_child.is_premium.should be_true
    end
    
    it "should not have dvc set" do
      @tw.dvc_member.should be_false
    end
  end
  
  describe "when visiting for 5 days as a dvc member with no water park visits and no park hopping" do
    before :each do
      @tw.days = 5
      @tw.dvc_member = true
      @tw.calculate_tickets
    end
    
    it "should have an adult myw price of 228" do
      @tw.myw_adult.price.should be(228)
    end
    
    it "should have a child myw price of 195" do
      @tw.myw_child.price.should be(195)
    end
    
    it "should have an adult annual pass price of 389" do
      @tw.ap_adult.price.should be(389)
    end
    
    it "should have a child annual price pass of 344" do
      @tw.ap_child.price.should be(344)
    end
    
    it "should not have a premium adult annual pass" do
      @tw.ap_adult.is_premium.should be_false
    end
    
    it "should not have a premium child annual pass" do
      @tw.ap_child.is_premium.should be_false
    end
  end
  
  describe "when visiting for 3 days with 1 water park visit" do
    before :each do
      @tw.days = 3
      @tw.water_park_visits = 1
      @tw.calculate_tickets
    end
    
    it "should have an adult myw price of 219" do
      @tw.myw_adult.price.should be(219)
    end
    
    it "should have an adult annual pass price of 489" do
      @tw.ap_adult.price.should be(489)
    end
    
    it "should have a myw water park ticket count of 1" do
      @tw.myw_water_park_tickets_needed.should be(1)
    end
    
    it "should have a ap water park ticket count of 1" do
      @tw.ap_water_park_tickets_needed.should be(1)
    end
  end
  
  #add ticket recommendations
  #use cucumber
end
