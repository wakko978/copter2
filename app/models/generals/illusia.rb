class Illusia < General
  def attack_bonus(profile,recruit)
    bonus = super
    
    case recruit.promote_level_bonus
    when 1
      bonus += 1
    when 2
      bonus += 3
    when 3
      bonus += 6
    when 4..General.max_level
      bonus += step_function(recruit.promote_level_bonus,{pos_index: 8, offset: 3, period: 2})
    end
    return bonus.round()
  end
end
