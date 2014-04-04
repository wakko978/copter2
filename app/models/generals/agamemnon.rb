class Agamemnon < General
  def monster_bonus_only?
    true
  end
  
  def monster_attack(recruit)
    monster_attack = 0
    
    case recruit.level
    when 1..4
      monster_attack += 10 + (recruit.level * 5)
    when 5..General.max_level
      monster_attack += 30 + ((recruit.level - 4) * 13)
    end
    
    return monster_attack
  end
end
