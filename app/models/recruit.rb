class Recruit < ActiveRecord::Base
  attr_accessible :name, :general, :general_id, :profile_id, :level
  
  validates :general_id, :presence => true
  validates :level, :presence => true, :numericality => { :only_integer => true, :less_than_or_equal_to => 50 }
    
  belongs_to :profile
  belongs_to :general
  has_one :primary_alliance, :class_name => "Alliance", :foreign_key => :primary_link
  has_one :secondary_alliance, :class_name => "Alliance", :foreign_key => :secondary_link
  has_one :tertiary_alliance, :class_name => "Alliance", :foreign_key => :tertiary_link
  has_many :loadouts, :foreign_key => :general_id
  
  def name
    general.name
  end
  
  def name=(val)
    self[:name] = val
  end
  
  def piercing
    general.piercing(self)
  end
  
  def resistance
    general.resistance(self)
  end
  
  def monster_bonus_only?
    general.monster_bonus_only?
  end
  
  def monster_attack
    general.monster_attack(self)
  end
  
  def attack
    attack = general.attack
    unless general.has_special_leveling_increment?
      attack += ((level - 1) * general.attack_increment)
    else
      attack += general.special_leveling_increment(self,'attack')
    end
    
    [20, 25, 30].each do |i|
      if level >= i
        attack += 15 if general.general_type == 'Aggressive'
        attack += 10 if general.general_type == 'Balanced'
        attack += 5 if general.general_type == 'Defensive'
      end
    end
    if level >= 35
      attack += 20 if general.general_type == 'Aggressive'
      attack += 15 if general.general_type == 'Balanced'
      attack += 15 if general.general_type == 'Defensive'
    end
    if level >=40
      attack += 25 if general.general_type == 'Aggressive'
      attack += 25 if general.general_type == 'Balanced'
      attack += 15 if general.general_type == 'Defensive'
    end
    if level >= 45
      attack += 30 if general.general_type == 'Aggressive'
      attack += 25 if general.general_type == 'Balanced'
      attack += 15 if general.general_type == 'Defensive'
    end
    if level >= 50
      attack += 60 if general.general_type == 'Aggressive'
      attack += 25 if general.general_type == 'Balanced'
      attack += 30 if general.general_type == 'Defensive'
    end
    
    if (alliance = self.primary_alliance)
      attack += (alliance.secondary.attack * 0.5).floor
      attack += (alliance.tertiary.attack * 0.33).floor unless alliance.tertiary.nil?
    end
    
    return attack
  end
  
  def defense
    defense = general.defense
    unless general.has_special_leveling_increment?
      defense += ((level - 1) * general.defense_increment)
    else
      defense += general.special_leveling_increment(self,'defense')
    end
    [20, 25, 30].each do |i|
      if level >= i
        defense += 5 if general.general_type == 'Aggressive'
        defense += 10 if general.general_type == 'Balanced'
        defense += 15 if general.general_type == 'Defensive'
      end
    end
    if level >= 35
      defense += 15 if general.general_type == 'Aggressive'
      defense += 15 if general.general_type == 'Balanced'
      defense += 20 if general.general_type == 'Defensive'
    end
    if level >=40
      defense += 15 if general.general_type == 'Aggressive'
      defense += 25 if general.general_type == 'Balanced'
      defense += 25 if general.general_type == 'Defensive'
    end
    if level >= 45
      defense += 15 if general.general_type == 'Aggressive'
      defense += 25 if general.general_type == 'Balanced'
      defense += 30 if general.general_type == 'Defensive'
    end
    if level >= 50
      defense += 30 if general.general_type == 'Aggressive'
      defense += 25 if general.general_type == 'Balanced'
      defense += 60 if general.general_type == 'Defensive'
    end
    
    if (alliance = self.primary_alliance)
      defense += (alliance.secondary.defense * 0.5).floor
      defense += (alliance.tertiary.defense * 0.33).floor unless alliance.tertiary.nil?
    end
    
    return defense
  end
  
  def e_attack
    (general.attack_with_mods(profile,self) + general.defense_with_mods(profile,self)*0.7).round(1)
  end
  
  def e_defense
    (general.defense_with_mods(profile,self) + general.attack_with_mods(profile,self)*0.7).round(1)
  end
  
  def e_attack_no_mod
    (attack + defense*0.7).round(1)
  end
  
  def e_defense_no_mod
    (defense + attack*0.7).round(1)
  end
end
