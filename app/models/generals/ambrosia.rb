class Ambrosia < General
  def defense_bonus(profile,recruit)
    bonus = super
    
    count = profile.recruits.count
    case recruit.level
    when 1
      bonus += count * 0.15
    when 2
      bonus += count * 0.25
    when 3
      bonus += count * 0.35
    when 4, 5
      bonus += count * 0.45
    when 6..General.max_level
      bonus += count * (0.450 + ((recruit.level - 5) * 0.006))
    end
    return bonus.round()
  end
end
