class Spell < ActiveRecord::Base
  attr_accessible :power_id, :profile_id, :owned
    
  belongs_to :profile
  belongs_to :power
  
  validates :power_id, :presence => true
  validates :owned, :presence => true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
end
