class LotusRavenmoore < General
  def attack_bonus(profile,recruit)
    bonus = super
    
    case recruit.level
    when 5..General.max_level
      bonus += recruit.level
    end
    return bonus.round()
  end
end
