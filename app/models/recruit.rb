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
    return defense
  end
  
  def e_attack
    (general.attack_with_mods(profile,self) + general.defense_with_mods(profile,self)*0.7).round(1)
  end
  
  def e_defense
    (general.defense_with_mods(profile,self) + general.attack_with_mods(profile,self)*0.7).round(1)
  end
end
