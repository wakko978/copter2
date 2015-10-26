class Vancy < General
  def monster_bonus_only?
    true
  end
  
  def monster_attack(recruit)
    monster_attack = 0
    
    case recruit.promote_level_bonus
    when 1
      monster_attack += 230
    when 2
      monster_attack += 250
    when 3
      monster_attack += 270
    when 4
      monster_attack += 290
    when 5..General.max_level
      monster_attack += ((recruit.promote_level_bonus - 2) * 30) + 230
    end
    
    return monster_attack
  end
end
