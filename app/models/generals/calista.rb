class Calista < General
  def attack_bonus(profile,recruit)
    bonus = super
    
    count = profile.inventory_count('soldiers','Vampire Lord')
    case recruit.promote_level_bonus
    when 1
      bonus += (count * 0.2) > 12 ? 12 : (count * 0.2)
    when 2
      bonus += (count * 0.3) > 12 ? 12 : (count * 0.3)
    when 3
      bonus += (count * 0.4) > 12 ? 12 : (count * 0.4)
    when 4
      bonus += (count * 0.5) > 12 ? 12 : (count * 0.5)
    when 5..General.max_level
      max = step_function(recruit.promote_level_bonus,{multiplier: 3, offset: 4, period: 3})
      bonus += (count * 0.5) > max ? max : (count * 0.5)
    end
    return bonus.round()
  end
end
