class Katherine < General
  def resistance(recruit)
    mod1 = 0
    mod2 = 0
    
    if (alliance = recruit.primary_alliance)
      mod1 = (alliance.secondary.resistance * 0.5).floor
      mod2 = (alliance.tertiary.resistance * 0.33).floor unless alliance.tertiary.nil?
    end
    
    case recruit.level
    when 1..4
      return 25 + ((recruit.level - 1) * 10) + mod1 + mod2
    else
      return 55 + mod1 + mod2
    end
  end
end
