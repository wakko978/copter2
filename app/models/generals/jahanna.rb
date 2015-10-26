class Jahanna < General
  def attack_bonus(profile,recruit)
    bonus = super
    count = profile.health / 4

    case recruit.promote_level_bonus
    when 1
      bonus += count * 0.6
    when 2
      bonus += count * 0.8
    when 3
      bonus += count
    when 4..General.max_level
      bonus += count * 1.1
    end
    return bonus.round()
  end
end
