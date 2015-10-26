class Evalice < General
  def attack_bonus(profile,recruit)
    bonus = super
    
    defense = profile.defense
    
    case recruit.promote_level_bonus
    when 1
      bonus += (defense * 0.15)
    when 2
      bonus += (defense * 0.20)
    when 3
      bonus += (defense * 0.25)
    when 4..General.max_level
      bonus += (defense * 0.30)
    end
    return bonus.round()
  end
  
  def defense_bonus(profile,recruit)
    bonus = super
    
    defense = profile.defense
    
    case recruit.promote_level_bonus
    when 1
      bonus -= (defense * 0.15)
    when 2
      bonus -= (defense * 0.20)
    when 3
      bonus -= (defense * 0.25)
    when 4..General.max_level
      bonus -= (defense * 0.30)
    end
    return bonus.round()
  end
end
