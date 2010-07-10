class MagicYourWay
  attr_accessor :base_price
  attr_accessor :price
  attr_accessor :no_of_days
  
  attr_reader :no_expire
  attr_reader :hopper_price
  attr_reader :water_park_add_on_price
  
  def initialize
    @hopper_price = 52
    @water_park_add_on_price = 52
    @no_expire = {
      "1" => 0,
      "2" => 18,
      "3" => 24,
      "4" => 52,
      "5" => 73,
      "6" => 84,
      "7" => 115,
      "8" => 152,
      "9" => 178,
      "10" => 209
    }
  end
  
  def adult
    @base_price = {
      "1" => 79,
      "2" => 156,
      "3" => 219,
      "4" => 225,
      "5" => 228,
      "6" => 231,
      "7" => 234,
      "8" => 237,
      "9" => 240,
      "10" => 243
    }
    
    self
  end
  
  def child
    @base_price = {
      "1" => 68,
      "2" => 133,
      "3" => 187,
      "4" => 192,
      "5" => 195,
      "6" => 198,
      "7" => 201,
      "8" => 204,
      "9" => 207,
      "10" => 210
    }
    self
  end
  
  def days(no_of_days)
    @no_of_days = no_of_days
    self.price = base_price[no_of_days.to_s]
    self
  end
  
  def with_no_expire
    self.price += no_expire[no_of_days.to_s]
    self
  end
  
  def park_hopper
    self.price += hopper_price
    self
  end

  def water_park_fun_and_more
    self.price += water_park_add_on_price
    self
  end
end