class Halcyon < General
  def attack_bonus(profile,recruit)
    bonus = super
    
    attack = profile.attack
    
    case recruit.promote_level_bonus
    when 1
      bonus -= (attack * 0.10)
    when 2
      bonus -= (attack * 0.15)
    when 3
      bonus -= (attack * 0.20)
    when 4..General.max_level
      bonus -= (attack * 0.25)
    end
    return bonus.round()
  end
  
  def defense_bonus(profile,recruit)
    bonus = super
    
    attack = profile.attack
    
    case recruit.promote_level_bonus
    when 1
      bonus += (attack * 0.10)
    when 2
      bonus += (attack * 0.15)
    when 3
      bonus += (attack * 0.20)
    when 4..General.max_level
      bonus += (attack * 0.25)
    end
    return bonus.round()
  end
end
