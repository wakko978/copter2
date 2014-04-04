class EternalAlystra < General
  def attack_bonus(profile,recruit)
    bonus = super
    mod1 = 0
    mod2 = 0
    
    if (alliance = recruit.primary_alliance)
      mod1 = (alliance.secondary.attack_bonus(profile,recruit) * 0.5).floor
      mod2 = (alliance.tertiary.attack_bonus(profile,recruit) * 0.33).floor unless alliance.tertiary.nil?
    end
    
    div_power = [ profile.div_weapons, profile.div_powers, profile.div_generals,
      profile.div_items('shield'), profile.div_items('helmet'), profile.div_items('armor'),
      profile.div_items('amulet'), profile.div_items('glove'), profile.div_items('boot')
    ].collect{|c| c.nil? ? 0 : (c[:best].nil? ? 0 : c[:best].div_power)}.sum
    case recruit.level
    when 1
      bonus += div_power * 0.1 + mod1 + mod2
    when 2..15
      bonus += div_power * (0.1 + (recruit.level.to_f - 1.0)*0.01) + mod1 + mod2
    when 16..General.max_level
      bonus += div_power * 0.24 + mod1 + mod2
    end
    return bonus.round()
  end
end
