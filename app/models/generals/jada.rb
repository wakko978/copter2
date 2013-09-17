class Jada < General
  def attack_bonus(profile,recruit)
    bonus = super
    
    count = profile.inventory_count('powers','Arcane Blast') / 10
    case recruit.level
    when 1
      bonus += (count * 0.4) > 10 ? 10 : (count * 0.4)
    when 2
      bonus += (count * 0.6) > 10 ? 10 : (count * 0.6)
    when 3
      bonus += (count * 0.8) > 10 ? 10 : (count * 0.8)
    when 4
      bonus += count > 10 ? 10 : count
    when 5..General.max_level
      max = step_function(recruit.level,{pos_index: -2, multiplier: 3, offset: 4, period: 3})
      bonus += count > max ? max : count
    end
    return bonus.round()
  end
end
