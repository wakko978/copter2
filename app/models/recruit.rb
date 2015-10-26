class Recruit < ActiveRecord::Base
  attr_accessible :name, :general, :general_id, :profile_id, :level, :promote_level
  
  validates :general_id, :presence => true
  validates :level, :presence => true, :numericality => { :only_integer => true, :less_than_or_equal_to => 100 }
    
  belongs_to :profile
  belongs_to :general
  has_one :primary_alliance, :class_name => "Alliance", :foreign_key => :primary_link
  has_many :secondary_alliances, :class_name => "Alliance", :foreign_key => :secondary_link
  has_many :tertiary_alliances, :class_name => "Alliance", :foreign_key => :tertiary_link
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
  
  def promote_level_bonus
    case promote_level
    when 1
      return level + 0
    when 2
      return level + 3
    when 3
      return level + 7
    when 4
      return level + 12
    when 5
      return level + 18
    when 6
      return level + 25
    when 7
      return level + 33
    when 8
      return level + 42
    end
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
      attack += 20 if general.general_type == 'Balanced'
      attack += 15 if general.general_type == 'Defensive'
    end
    if level >= 40
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
    if level >= 55
      attack += 80 if general.general_type == 'Aggressive'
      attack += 25 if general.general_type == 'Balanced'
      attack += 40 if general.general_type == 'Defensive'
    end
    [60, 65, 70, 75, 80].each do |i|
      if level >= i
        attack += 60 if general.general_type == 'Aggressive'
        attack += 50 if general.general_type == 'Balanced'
        attack += 30 if general.general_type == 'Defensive'
      end
    end
    
    case promote_level
    when 2
      attack = ((attack * 1.3) + 7).floor
    when 3
      attack = ((attack * 1.6) + 17).floor
    when 4
      attack = ((attack * 2.0) + 25).floor
    when 5
      attack = ((attack * 2.4) + 44).floor
    when 6
      attack = ((attack * 2.6) + 61).floor
    # when 7
    #   attack = ((attack * ?) + ?).floor
    # when 8
    #   attack = ((attack * ?) + ?).floor
    else
      attack = attack
    end
    
    return attack
  end
  
  def attack_alliance_bonus
    bonus = 0
    if self.primary_alliance
      alliance = self.primary_alliance
      bonus += (alliance.secondary.attack * 0.5).floor
      bonus += (alliance.tertiary.attack * 0.25).floor unless alliance.tertiary.nil?
      return bonus
    end
    return bonus
  end
  
  def attack_set_bonus
    if general.has_at_least?(3,profile,self)
      return (attack * 0.1).floor
    end
    return 0
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
      defense += 20 if general.general_type == 'Balanced'
      defense += 20 if general.general_type == 'Defensive'
    end
    if level >= 40
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
    if level >= 55
      defense += 40 if general.general_type == 'Aggressive'
      defense += 25 if general.general_type == 'Balanced'
      defense += 80 if general.general_type == 'Defensive'
    end
    [60, 65, 70, 75, 80].each do |i|
      if level >= i
        defense += 30 if general.general_type == 'Aggressive'
        defense += 50 if general.general_type == 'Balanced'
        defense += 60 if general.general_type == 'Defensive'
      end
    end
    
    case promote_level
    when 2
      defense = ((defense * 1.3) + 7).floor
    when 3
      defense = ((defense * 1.6) + 17).floor
    when 4
      defense = ((defense * 2.0) + 25).floor
    when 5
      defense = ((defense * 2.4) + 44).floor
    when 6
      defense = ((defense * 2.6) + 61).floor
    # when 7
    #   defense = ((defense * ?) + ?).floor
    # when 8
    #   defense = ((defense * ?) + ?).floor
    else
      defense = defense
    end
    
    return defense
  end
  
  def defense_alliance_bonus
    bonus = 0
    if self.primary_alliance
      alliance = self.primary_alliance
      bonus += (alliance.secondary.defense * 0.5).floor
      bonus += (alliance.tertiary.defense * 0.25).floor unless alliance.tertiary.nil?
      return bonus
    end
    return bonus
  end
  
  def defense_set_bonus
    if general.has_at_least?(3,profile,self)
      return (defense * 0.1).floor
    end
    return 0
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
