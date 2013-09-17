class EternalAlystra < General
  def attack_bonus(profile,recruit)
    bonus = super
    
    div_power = [ profile.div_weapons, profile.div_powers, profile.div_generals,
      profile.div_items('shield'), profile.div_items('helmet'), profile.div_items('armor'),
      profile.div_items('amulet'), profile.div_items('glove'), profile.div_items('boot')
    ].collect{|c| c.nil? ? 0 : (c[:best].nil? ? 0 : c[:best].div_power)}.sum
    case recruit.level
    when 1
      bonus += div_power * 0.1
    when 2..15
      bonus += div_power * (0.1 + (recruit.level.to_f - 1.0)*0.01)
    when 16..General.max_level
      bonus += div_power * 0.24
    end
    return bonus.round()
  end
end
