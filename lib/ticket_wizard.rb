class TicketWizard
  attr_accessor :days
  attr_accessor :water_park_visits
  attr_accessor :park_hopping
  attr_accessor :dvc_member
  
  attr_accessor :myw_adult
  attr_accessor :myw_child
  attr_accessor :ap_adult
  attr_accessor :ap_child
  
  def initialize
    @water_park_visits = 0
    @days = 0
    
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
  end
end