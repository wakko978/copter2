class Crissana < General
  def attack_bonus(profile,recruit)
    bonus = super
    
    case recruit.level
    when 1, 2, 3
      bonus += recruit.level
    when 4..General.max_level
      bonus += step_function(recruit.level,{offset: 3, period: 2})
    end
    return bonus.round()
  end
  
  def defense_bonus(profile,recruit)
    bonus = super
    
    case recruit.level
    when 1, 2, 3
      bonus += recruit.level
    when 4..General.max_level
      bonus += step_function(recruit.level,{offset: 3, period: 2})
    end
    return bonus.round()
  end
end
