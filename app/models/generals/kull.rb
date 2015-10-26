class Kull < General
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
    
    count = profile.inventory_count('soldiers','Orc Marauder')
    case recruit.promote_level_bonus
    when 1
      bonus += (count * 0.5) > 50 ? 50 : (count * 0.5)
    when 2
      bonus += count > 50 ? 50 : count
    when 3
      bonus += (count * 1.5) > 50 ? 50 : (count * 1.5)
    when 4
      bonus += (count * 2.0) > 50 ? 50 : (count * 2.0)
    when 5..General.max_level
      max = step_function(recruit.promote_level_bonus,{pos_index: 38, multiplier: 3, offset: 4, period: 3})
      bonus += (count * 2.0) > max ? max : (count * 2.0)
    end
    return bonus.round()
  end
end
