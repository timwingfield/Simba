class TicketWizard
  attr_accessor :days
  attr_accessor :water_park_visits
  attr_accessor :park_hopping
  attr_accessor :dvc_member
  
  attr_accessor :myw_adult
  attr_accessor :myw_child
  attr_accessor :ap_adult
  attr_accessor :ap_child
  
  attr_accessor :myw_water_park_tickets_needed
  attr_accessor :ap_water_park_tickets_needed
  
  def initialize
    @water_park_visits = 0
    @days = 0
    
    @myw_water_park_tickets_needed = 0
    @ap_water_park_tickets_needed = 0
    
    @myw_adult = MagicYourWay.new.adult
    @myw_child = MagicYourWay.new.child
    @ap_adult = AnnualPass.new.adult
    @ap_child = AnnualPass.new.child
  end
  
  def calculate_tickets
    myw_adult.days(@days)
    myw_child.days(@days)
    
    if park_hopping
      myw_adult.park_hopper
      myw_child.park_hopper
    end
    
    if water_park_visits >= 2
      myw_adult.water_park_fun_and_more
      myw_child.water_park_fun_and_more
    end
    
    if water_park_visits >=3
      ap_adult.premium
      ap_child.premium
    end
    
    if water_park_visits == 1
      @myw_water_park_tickets_needed = 1
      @ap_water_park_tickets_needed = 1
    end
    
    if water_park_visits == 2
      @ap_water_park_tickets_needed = 2
    end
    
    if dvc_member
      ap_adult.dvc
      ap_child.dvc
    end
  end

  def recommend
    calculate_tickets

    tickets = {
      "Adult Magic Your Way" => self.myw_adult.price,
      "Child Magic Your Way" => self.myw_child.price 
    }
  end
end
