class Scourge < General
  def attack_bonus(profile,recruit)
    bonus = super
    
    case recruit.level
    when 1
      bonus += 5
    when 2
      bonus += 9
    when 3
      bonus += 13
    when 4..General.max_level
      bonus += step_function(recruit.level,{pos_index: 16, offset: 5, period: 2})
    end
    return bonus.round()
  end
  
  def defense_bonus(profile,recruit)
    bonus = super
    
    case recruit.level
    when 1
      bonus -= 5
    when 2
      bonus -= 10
    when 3
      bonus -= 15
    when 4..General.max_level
      bonus -= (recruit.level + 20)
    end
    return bonus.round()
  end
end
