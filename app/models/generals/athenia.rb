class Athenia < General
  def attack_bonus(profile,recruit)
    bonus = super
    
    count = profile.inventory_count('powers','Royal Seal') / 50
    case recruit.promote_level_bonus
    when 1
      bonus += (count * 0.4) > 12 ? 12 : (count * 0.4)
    when 2
      bonus += (count * 0.6) > 12 ? 12 : (count * 0.6)
    when 3
      bonus += (count * 0.8) > 12 ? 12 : (count * 0.8)
    when 4
      bonus += count > 12 ? 12 : count
    when 5..General.max_level
      max = step_function(recruit.promote_level_bonus,{multiplier: 3, offset: 4, period: 3})
      bonus += count > max ? max : count
    end
    return bonus.round()
  end
end
