class Sylvana < General
  def attack_bonus(profile,recruit)
    bonus = super
    
    case recruit.level
    when 1..3
      bonus += recruit.level
    when 4..General.max_level
      bonus += step_function(recruit.level,{pos_index: 1, offset: 3, period: 2})
    end
    return bonus.round()
  end
  
  def defense_bonus(profile,recruit)
    bonus = super
    
    case recruit.level
    when 1
      bonus += 3
    when 2
      bonus += 5
    when 3
      bonus += 10
    when 4
      bonus += 15
    when 5..General.max_level
      bonus += 15 + (6.5 * (15-4)).to_i
    end
    return bonus.round()
  end
end
