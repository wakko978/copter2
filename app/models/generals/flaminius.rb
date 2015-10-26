class Flaminius < General
  def attack_bonus(profile,recruit)
    bonus = super
    
    count = profile.inventory_count('weapons','Flamewalker')
    case recruit.promote_level_bonus
    when 1
      bonus += (count * 0.5) > 50 ? 50 : (count * 0.5)
    when 2
      bonus += count > 50 ? 50 : count
    when 3
      bonus += (count * 1.5) > 50 ? 50 : (count * 1.5)
    when 4..General.max_level
      bonus += (count * 2) > 50 ? 50 : (count * 2)
    end
    return bonus.round()
  end
end
