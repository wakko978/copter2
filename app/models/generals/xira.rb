class Xira < General
  def attack_bonus(profile,recruit)
    bonus = super
    
    case recruit.promote_level_bonus
    when 1
      bonus += (defense * 0.1)
    when 2
      bonus += (defense * 0.15)
    when 3
      bonus += (defense * 0.2)
    when 4..General.max_level
      bonus += (defense * 0.25)
    end
    return bonus.round()
  end
  
  def defense_bonus(profile,recruit)
    bonus = super
    
    case recruit.promote_level_bonus
    when 1
      bonus -= (defense * 0.1)
    when 2
      bonus -= (defense * 0.15)
    when 3
      bonus -= (defense * 0.2)
    when 4..General.max_level
      bonus -= (defense * 0.25)
    end
    return bonus.round()
  end
end
