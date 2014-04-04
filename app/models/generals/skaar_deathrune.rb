class SkaarDeathrune < General
  def has_special_leveling_increment?
    true
  end

  def special_leveling_increment(recruit,stat)
    case recruit.level
    when 1
      return 0
    when 2..4
      return (recruit.level - 1) * 3
    else
      return 9 + (recruit.level - 4)
    end
  end
  
  def attack_bonus(profile,recruit)
    bonus = super
    
    case recruit.level
    when 1
      bonus += 6
    when 2
      bonus += 14
    when 3
      bonus += 24
    when 4..General.max_level
      bonus += step_function(recruit.level,{pos_index: 36, offset: 3, period: 2})
    end
    return bonus.round()
  end
end
