class Aurora < General
  def attack_bonus(profile,recruit)
    bonus = super
    
    count = profile.health / 4
    case recruit.level
    when 1
      bonus += count * 0.4
    when 2
      bonus += count * 0.6
    when 3
      bonus += count * 0.8
    when 4
      bonus += count
    when 5..General.max_level
      bonus += count + (recruit.level / 4)
    end
    return bonus.round()
  end
end
