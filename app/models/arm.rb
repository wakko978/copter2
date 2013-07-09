class Arm < ActiveRecord::Base
  attr_accessible :weapon_id, :profile_id, :owned
    
  belongs_to :profile
  belongs_to :weapon
  
  validates :weapon_id, :presence => true
  validates :owned, :presence => true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
end
