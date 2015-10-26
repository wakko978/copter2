class Gallador < General
  def defense_bonus(profile,recruit)
    bonus = super
    
    count = profile.inventory_count('soldiers','Valor Knights') / 50
    case recruit.promote_level_bonus
    when 1
      bonus += (count * 0.4) > 10 ? 10 : (count * 0.4)
    when 2
      bonus += (count * 0.6) > 10 ? 10 : (count * 0.6)
    when 3
      bonus += (count * 0.8) > 10 ? 10 : (count * 0.8)
    when 4
      bonus += count > 10 ? 10 : count
    when 5..General.max_level
      max = step_function(recruit.promote_level_bonus,{pos_index: -2, multiplier: 3, offset: 4, period: 3})
      bonus += count > max ? max : count
    end
    return bonus.round()
  end
end
