class Annika < General
  def piercing(recruit,skip_alliance=false)
    mod1 = 0
    mod2 = 0
    
    if recruit.primary_alliance && !skip_alliance
      alliance = recruit.primary_alliance
      mod1 = (alliance.secondary.piercing(true) * 0.5).floor
      mod2 = (alliance.tertiary.piercing(true) * 0.33).floor unless alliance.tertiary.nil?
    end
      
    case recruit.level
    when 1..4
      return (recruit.level + 1) * 10 + mod1 + mod2
    else
      return 50 + mod1 + mod2
    end
  end
end