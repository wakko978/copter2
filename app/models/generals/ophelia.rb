class Ophelia < General
  def attack_bonus(profile,recruit)
    bonus = super
    
    case recruit.level
    when 1, 2, 3
      bonus += recruit.level * 5
    when 4..General.max_level
      bonus += step_function(recruit.level,{pos_index: 20, offset: 5, period: 2})
    end
    return bonus.round()
  end
  
  def defense_bonus(profile,recruit)
    bonus = super
    
    case recruit.level
    when 1, 2, 3
      bonus -= recruit.level * 5
    when 4..General.max_level
      bonus -= step_function(recruit.level,{pos_index: 20, offset: 5, period: 2})
    end
    
    return bonus.round()
  end
end
