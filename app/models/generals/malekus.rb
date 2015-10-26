class Malekus < General
  def piercing(recruit)
    case recruit.promote_level_bonus
    when 5..General.max_level
      return (10 + (recruit.promote_level_bonus - 5) * 0.5).floor
    else
      return 0
    end
  end
  
  def has_special_leveling_increment?
    true
  end
  
  def special_leveling_increment(recruit,stat)
    case recruit.promote_level_bonus
    when 1
      return 0
    when 2..5
      return (recruit.promote_level_bonus - 1) * 3
    when 6..General.max_level
      return 12 + ((recruit.promote_level_bonus - 5) * 2)
    end
  end
  
  def attack_bonus(profile,recruit)
    bonus = super
    
    count = profile.recruits.count
    case recruit.promote_level_bonus
    when 1
      bonus += count * 0.25
    when 2
      bonus += count * 0.45
    when 3
      bonus += count * 0.65
    when 4
      bonus += count * 0.85
    when 5..General.max_level
      bonus += count * (0.85 + (recruit.promote_level_bonus - 5) * 0.006)
    end
    
    return bonus.round()
  end
end
