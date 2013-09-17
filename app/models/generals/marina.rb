class Marina < General
  def defense_bonus(profile,recruit)
    bonus = super
    
    case recruit.level
    when 1
      bonus += 1
    when 2
      bonus += 3
    when 3
      bonus += 6
    when 4
      bonus += 12
    when 5
      bonus += 13
    when 6..General.max_level
      bonus += step_function(recruit.level,{pos_index: 7, offset: 5, period: 2})
    end
    
    return bonus.round()
  end
end
