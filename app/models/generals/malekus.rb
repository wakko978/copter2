class Malekus < General
  def piercing(recruit,skip_alliance=false)
    case recruit.level
    when 5..General.max_level
      return step_function(recruit.level,{pos_index: -1, offset: 6, period: 2})
    else
      return 0
    end
  end
  
  def has_special_leveling_increment?
    true
  end
  
  def special_leveling_increment(recruit,stat)
    case recruit.level
    when 1
      return 0
    when 2..5
      return (recruit.level - 1) * 3
    when 6..General.max_level
      return 12 + ((recruit.level - 5) * 2)
    end
  end
  
  def attack_bonus(profile,recruit)
    bonus = super
    
    count = profile.recruits.count
    case recruit.level
    when 1
      bonus += count * 0.25
    when 2
      bonus += count * 0.45
    when 3
      bonus += count * 0.65
    when 4
      bonus += count * 0.85
    when 5..General.max_level
      bonus += count * (0.85 + (recruit.level - 5) * 0.006)
    end
    
    return bonus.round()
  end
end
