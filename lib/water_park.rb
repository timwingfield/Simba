class WaterPark
  attr_accessor :price
  
  def adult
    @price = 46
    self
  end
  
  def child
    @price = 40
    self
  end
end