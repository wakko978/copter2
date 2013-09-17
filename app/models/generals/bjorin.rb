class Bjorin < General
  def attack_bonus(profile,recruit)
    bonus = super
    
    count = profile.inventory_count('soldiers','Valdonian Mystic Mage')
    case recruit.level
    when 1
      bonus += (count * 0.5) > 50 ? 50 : (count * 0.5)
    when 2
      bonus += count > 50 ? 50 : count
    when 3
      bonus += (count * 1.5) > 50 ? 50 : (count * 1.5)
    when 4
      bonus += (count * 2.0) > 50 ? 50 : (count * 2.0)
    when 5..General.max_level
      max = step_function(recruit.level,{pos_index: 38, multiplier: 3, offset: 4, period: 3})
      bonus += (count * 2.0) > max ? max : (count * 2.0)
    end
    return bonus.round()
  end
end
