class Elora < General
  def attack_bonus(profile,recruit)
    bonus = super
    
    case recruit.level
    when 1
      bonus += 5
    when 2
      bonus += 8
    when 3
      bonus += 11
    when 4..General.max_level
      bonus += step_function(recruit.level,{pos_index: 10, offset: 5, period: 2})
    end
    return bonus.round()
  end
end
