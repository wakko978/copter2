class Anwar < General
  def defense_bonus(profile,recruit)
    bonus = super
    
    count = profile.inventory_count('powers','Wolf Spirit') / 3
    case recruit.promote_level_bonus
    when 1
      bonus += (count * 0.4) > 10 ? 10 : (count * 0.4)
    when 2
      bonus += (count * 0.6) > 10 ? 10 : (count * 0.6)
    when 3
      bonus += (count * 0.8) > 10 ? 10 : (count * 0.8)
    when 4
      bonus += count > 10 ? 10 : count
    else
      bonus += count > 10 ? 10 : count
    end
    return bonus.round()
  end
end
