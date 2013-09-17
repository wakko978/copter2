class Gorlak < General
  def attack_bonus(profile,recruit)
    bonus = super
    
    case recruit.level
    when 1, 2
      bonus += 1
    when 3, 4, 5
      bonus += 2
    when 6..General.max_level
      bonus += step_function(recruit.level,{pos_index: -2, offset: 3, period: 2})
    end
    return bonus.round()
  end
end
