class Dante < General
  def attack_bonus(profile,recruit)
    bonus = super
    
    case recruit.promote_level_bonus
    when 1
      bonus -= 5
    when 2
      bonus -= 10
    when 3
      bonus -= 15
    when 4, 5
      bonus -= 25
    when 6..General.max_level
      bonus -= step_function(recruit.promote_level_bonus,{pos_index: 20, offset: 5, period: 2})
    end
    return bonus.round()
  end
  
  def defense_bonus(profile,recruit)
    bonus = super
    
    case recruit.promote_level_bonus
    when 1
      bonus += 4
    when 2
      bonus += 8
    when 3
      bonus += 12
    when 4, 5
      bonus += 20
    when 6..General.max_level
      bonus += step_function(recruit.promote_level_bonus,{pos_index: 15, offset: 5, period: 2})
    end
    return bonus.round()
  end
end
