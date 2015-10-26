class Cartigan < General
  def has_special_leveling_increment?
    true
  end
  
  def special_leveling_increment(recruit,stat)
    case stat
    when 'attack'
      case recruit.promote_level_bonus
      when 1
        return 0
      when 2
        return 2
      when 3
        return 3
      when 4
        return 4
      else
        return recruit.promote_level_bonus
      end
    when 'defense'
      return recruit.promote_level_bonus - 1
    end
  end
  
  def attack_bonus(profile,recruit)
    bonus = super
    
    case recruit.promote_level_bonus
    when 1, 2, 3
      bonus += recruit.promote_level_bonus
    when 4..General.max_level
      bonus += step_function(recruit.promote_level_bonus,{offset: 3, period: 2})
    end
    return bonus.round()
  end
end
