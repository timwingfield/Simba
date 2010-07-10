require File.dirname(__FILE__) + '/spec_helper'

describe MagicYourWay do
  before :each do
    @myw = MagicYourWay.new
  end
  
  describe "and getting adult prices" do  
    describe "and getting base ticket prices" do
     it "should return 79 for a one day ticket" do
       @myw.adult.days(1).price.should be(79)
     end
   
     it "should return 228 for a 5 day ticket" do
       @myw.adult.days(5).price.should be(228)
     end
    end
  
    describe "and getting park hopper ticket prices" do
      it "should return 277 for a 4 day park hopper" do
        @myw.adult.days(4).park_hopper.price.should be(277)
      end
    
      it "should return 295 for a 10 day park hopper" do
        @myw.adult.days(10).park_hopper.price.should be(295)
      end
    end
  
    describe "and getting the water park add on" do
      it "should retun 208 for a 2 day water park fun and more ticket" do
        @myw.adult.days(2).water_park_fun_and_more.price.should be(208)
      end
    
      it "should return 289 for an 8 day water park fun and more ticket" do      
        @myw.adult.days(8).water_park_fun_and_more.price.should be(289)
      end
    end
  
    describe "and getting a hopper and water park option" do
      it "should return 323 for a 3 day ticket" do
        @myw.adult.days(3).park_hopper.water_park_fun_and_more.price.should be(323)
      end
    
      it "should 335 for a 6 day ticket" do
        @myw.adult.days(6).water_park_fun_and_more.park_hopper.price.should be(335)
      end
    end
  
    describe "and getting the no expiration option on a base ticket" do
      it "should return 452 for a 10 day ticket" do
        @myw.adult.days(10).with_no_expire.price.should be(452)
      end
    
      it "should return 301 for a 5 day ticket" do
        @myw.adult.days(5).with_no_expire.price.should be(301)
      end
    
      it "should return 174 for a 2 day ticket" do
        @myw.adult.days(2).with_no_expire.price.should be(174)
      end
      
      it "should return XX for a 6 day park hopper" do
        @myw.adult.days(6).with_no_expire.park_hopper.price.should be(367)
      end
      
      it "should return XX for a 8 day park hopper with water park fun and more" do
        @myw.adult.days(8).park_hopper.water_park_fun_and_more.with_no_expire.price.should be(493)
      end
    end    
  end
end