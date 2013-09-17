class Feral < General
  def monster_bonus_only?
    true
  end
  
  def monster_attack(recruit)
    monster_attack = 0
    mod1 = 0
    mod2 = 0
    
    if (alliance = recruit.primary_alliance)
      mod1 = (alliance.secondary.monster_attack * 0.5).floor
      mod2 = (alliance.tertiary.monster_attack * 0.33).floor unless alliance.tertiary.nil?
    end
    
    case recruit.level
    when 1..3
      monster_attack += recruit.level * 5 + 7 + mod1 + mod2
    when 4
      monster_attack += recruit.level * 5 + 8 + mod1 + mod2
    when 5
      monster_attack += recruit.level * 8 + 8 + mod1 + mod2
    when 6
      monster_attack += recruit.level * 8 + 40 + mod1 + mod2
    when 7..General.max_level
      monster_attack += (recruit.level - 6) * 30 + 88 + mod1 + mod2
    end
    
    return monster_attack
  end
end
