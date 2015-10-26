class Kaylen < General
  def attack_bonus(profile,recruit)
    bonus = super
    
    count = profile.recruits.count
    case recruit.promote_level_bonus
    when 1
      bonus += count * 0.04
    when 2
      bonus += count * 0.07
    when 3
      bonus += count * 0.1
    when 4
      bonus += count * 0.15
    when 5..General.max_level
      bonus += count * (0.150 + (recruit.promote_level_bonus - 4) * 0.006)
    end
    return bonus.round()
  end
end
