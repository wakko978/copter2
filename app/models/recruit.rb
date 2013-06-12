class Recruit < ActiveRecord::Base
  attr_accessible :name, :general, :general_id, :profile_id, :level
  
  validates :level, :presence => true, :numericality => { :only_integer => true, :less_than_or_equal_to => 50 }
    
  belongs_to :profile
  belongs_to :general
  
  def name
    general.name
  end
  
  def name=(val)
    self[:name] = val
  end
  
  def attack
    unless general.has_special_leveling_increment?
      general.attack + ((level - 1) * general.attack_increment)
    else
      general.attack + general.special_leveling_increment(self)
    end
  end
  
  def defense
    unless general.has_special_leveling_increment?
      general.defense + ((level - 1) * general.defense_increment)
    else
      general.defense + general.special_leveling_increment(self)
    end
  end
  
  def e_attack
    (general.attack_with_mods(profile,self) + general.defense_with_mods(profile,self)*0.7).round(1)
  end
  
  def e_defense
    (general.defense_with_mods(profile,self) + general.attack_with_mods(profile,self)*0.7).round(1)
  end
end
