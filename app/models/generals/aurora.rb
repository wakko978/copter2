class Aurora < General
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
    
    count = profile.health / 4
    case recruit.level
    when 1
      bonus += count * 0.4
    when 2
      bonus += count * 0.6
    when 3
      bonus += count * 0.8
    when 4
      bonus += count
    when 5..General.max_level
      bonus += count + (recruit.level / 4)
    end
    return bonus.round()
  end
end
