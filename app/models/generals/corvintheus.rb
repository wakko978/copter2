class Corvintheus < General
  def defense_bonus(profile,recruit)
    bonus = super
    count = profile.health / 3

    case recruit.promote_level_bonus
    when 1
      bonus += count * 0.4
    when 2
      bonus += count * 0.6
    when 3
      bonus += count * 0.8
    when 4..General.max_level
      bonus += count
    end
    return bonus.round()
  end
end
