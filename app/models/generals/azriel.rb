class Azriel < General
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
    
    count = profile.inventory_count('soldiers','Archangel')
    case recruit.level
    when 1
      bonus += (count * 0.125) > 40 ? 40 : (count * 0.125)
    when 2
      bonus += (count * 0.25) > 40 ? 40 : (count * 0.25)
    when 3
      bonus += (count * 0.375) > 40 ? 40 : (count * 0.375)
    when 4
      bonus += (count * 0.5) > 40 ? 40 : (count * 0.5)
    when 5..General.max_level
      max = step_function(recruit.level,{pos_index: 28, multiplier: 3, offset: 4, period: 3})
      bonus += count > max ? max : count
    end
    return bonus.round()
  end
end
