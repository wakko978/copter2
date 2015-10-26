class SkaarDeathrune < General
  def has_special_leveling_increment?
    true
  end

  def special_leveling_increment(recruit,stat)
    case recruit.promote_level_bonus
    when 1
      return 0
    when 2..4
      return (recruit.promote_level_bonus - 1) * 3
    else
      return 9 + (recruit.promote_level_bonus - 4)
    end
  end
  
  def attack_bonus(profile,recruit)
    bonus = super
    
    case recruit.promote_level_bonus
    when 1
      bonus += 6
    when 2
      bonus += 14
    when 3
      bonus += 24
    when 4..General.max_level
      bonus += step_function(recruit.promote_level_bonus,{pos_index: 36, offset: 3, period: 2})
    end
    return bonus.round()
  end
end
