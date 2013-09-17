class Vulcan < General
  def defense_bonus(profile,recruit)
    bonus = super
    
    case recruit.level
    when 1
      bonus += 3
    when 2
      bonus += 7
    when 3
      bonus += 12
    when 4..General.max_level
      bonus += step_function(recruit.level,{pos_index: 11, offset: 3, period: 2})
    end
    return bonus.round()
  end
end
