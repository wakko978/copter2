class Property < ActiveRecord::Base
  attr_accessible :land_id, :profile_id, :owned
    
  belongs_to :profile
  belongs_to :land
  
  validates :land_id, :presence => true
  validates :owned, :presence => true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  
  def roi
    owned >= profile.max_property ? 'N/A' : sprintf("%.5f", (land.income / next_cost_to_buy)*100).to_f
  end
  
  def next_cost_to_buy
    owned >= profile.max_property ? 0 : land.incremental_cost * owned * land.base_cost + land.base_cost
  end
  
  def hours_to_save(cash_flow)
    cash_flow == 0 ? sprintf("%.3f", 0) : sprintf("%.3f", (next_cost_to_buy * 10) / cash_flow).to_f
  end
end
