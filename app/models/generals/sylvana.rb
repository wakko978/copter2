class Sylvana < General
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
    when 1..3
      bonus += recruit.level * 3
    when 4..General.max_level
      bonus += step_function((recruit.level * 3),{pos_index: 1, offset: 3, period: 2})
    end
    return bonus.round()
  end
  
  def defense_bonus(profile,recruit)
    bonus = super
    
    case recruit.level
    when 1
      bonus += 6
    when 2
      bonus += 10
    when 3
      bonus += 20
    when 4
      bonus += 25
    when 5
      bonus += 25 + 6.5.to_i
    when 6..General.max_level
      bonus += 25 + (6.5 * (recruit.level - 4).to_i)
    end
    return bonus.round()
  end
end
