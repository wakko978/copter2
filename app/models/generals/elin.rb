class Elin < General
  def monster_bonus_only?
    true
  end
  
  def monster_attack(recruit,skip_alliance=false)
    monster_attack = 0
    mod1 = 0
    mod2 = 0
    
    if recruit.primary_alliance && !skip_alliance
      alliance = recruit.primary_alliance
      mod1 = (alliance.secondary.monster_attack(true) * 0.5).floor
      mod2 = (alliance.tertiary.monster_attack(true) * 0.33).floor unless alliance.tertiary.nil?
    end
    
    case recruit.level
    when 1..4
      monster_attack += recruit.level * 5 + mod1 + mod2
    when 5..General.max_level
      monster_attack += (recruit.level - 5) * 30 + 50 + mod1 + mod2
    end
    
    return monster_attack
  end
end
