class AnnualPass
  attr_accessor :price
  attr_accessor :is_premium
  attr_accessor :is_dvc
  
  def adult
    @price_list = {
      "regular" => 489,
      "premium" => 619,
      "dvc_regular" => 389,
      "dvc_premium" => 494
    }
    
    set_price
    
    self
  end
  
  def child
    @price_list = {
      "regular" => 432,
      "premium" => 546,
      "dvc_regular" => 344,
      "dvc_premium" => 436
    }
    
    set_price
    
    self
  end
  
  def premium
    @is_premium = true
    set_price
    self
  end
  
  def dvc
    @is_dvc = true
    set_price
    self
  end
  
  private
  @price_list
  
  def set_price
    s = "regular"
    
    if @is_premium then s = "premium" end
    
    if @is_dvc then s = "dvc_#{s}" end
    
    @price = @price_list[s]
  end
end