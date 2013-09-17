class Suri < General
  def defense_bonus(profile,recruit)
    bonus = super
    
    count = profile.recruits.count
    case recruit.level
    when 1
      bonus += count * 0.05
    when 2
      bonus += count * 0.1
    when 3
      bonus += count * 0.15
    when 4
      bonus += count * 0.2
    when 5..General.max_level
      bonus += count * (0.20 + (recruit.level - 4) * 0.003)
    end
    return bonus.round()
  end
end
