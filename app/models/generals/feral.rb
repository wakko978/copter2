class Feral < General
  def monster_bonus_only?
    true
  end
  
  def monster_attack(recruit)
    monster_attack = 0
    
    case recruit.promote_level_bonus
    when 1..3
      monster_attack += recruit.promote_level_bonus * 5 + 7
    when 4
      monster_attack += recruit.promote_level_bonus * 5 + 8
    when 5
      monster_attack += recruit.promote_level_bonus * 8 + 8
    when 6
      monster_attack += recruit.promote_level_bonus * 8 + 40
    when 7..General.max_level
      monster_attack += (recruit.promote_level_bonus - 6) * 30 + 88
    end
    
    return monster_attack
  end
end
