class Azriel < General
  def attack_bonus(profile,recruit)
    bonus = super
    
    count = profile.inventory_count('soldiers','Archangel') / 50
    case recruit.level
    when 1
      bonus += (count * 0.25) > 40 ? 40 : (count * 0.25)
    when 2
      bonus += (count * 0.5) > 40 ? 40 : (count * 0.5)
    when 3
      bonus += (count * 0.75) > 40 ? 40 : (count * 0.75)
    when 4
      bonus += count > 40 ? 40 : count
    when 5..General.max_level
      max = step_function(recruit.level,{pos_index: 28, multiplier: 3, offset: 4, period: 3})
      bonus += count > max ? max : count
    end
    return bonus.round()
  end
end
