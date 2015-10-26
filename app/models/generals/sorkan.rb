class Sorkan < General
  def monster_bonus_only?
    true
  end
  
  def monster_attack(recruit)
    monster_attack = 0
    
    case recruit.promote_level_bonus
    when 1
      monster_attack += 200
    when 2
      monster_attack += 214
    when 3
      monster_attack += 228
    when 4
      monster_attack += 242
    when 5..General.max_level
      monster_attack += ((recruit.promote_level_bonus - 4) * 30) + 242
    end
    
    return monster_attack
  end
end
