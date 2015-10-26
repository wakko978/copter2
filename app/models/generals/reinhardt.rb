class Reinhardt < General
  def defense_bonus(profile,recruit)
    bonus = super
    
    case recruit.promote_level_bonus
    when 1
      bonus += 3 + 5
    when 2
      bonus += 5 + 8
    when 3
      bonus += 7 + 13
    when 4..General.max_level
      bonus += step_function(recruit.promote_level_bonus,{pos_index: 4, offset: 5, period: 2}) + (recruit.promote_level_bonus + 2)*3
    end
    return bonus.round()
  end
end
