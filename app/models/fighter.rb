class Fighter < ActiveRecord::Base
  attr_accessible :soldier_id, :profile_id, :owned
    
  belongs_to :profile
  belongs_to :soldier
  
  validates :soldier_id, :presence => true
  validates :owned, :presence => true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
end
