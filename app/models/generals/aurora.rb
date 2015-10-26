class Aurora < General
  def has_special_leveling_increment?
    true
  end

  def special_leveling_increment(recruit,stat)
    case recruit.promote_level_bonus
    when 1
      return 0
    when 2
      return 3
    when 3, 4
      return 3 * (recruit.level - 1)
    else
      return 9 + (recruit.level - 4)
    end
  end
  
  def attack_bonus(profile,recruit)
    bonus = super
    count = profile.health / 4
    
    case recruit.promote_level_bonus
    when 1
      bonus += count * 0.4
    when 2
      bonus += count * 0.6
    when 3
      bonus += count * 0.8
    when 4..General.max_level
      case recruit.promote_level_bonus
      when 5..14
        count = (profile.health + recruit.promote_level_bonus) / 4
      else
        count = (profile.health + 14) / 4
      end
      bonus += count
    end
    return bonus.round()
  end
end
