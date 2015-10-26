class NeoAlystra < General
  def attack_bonus(profile,recruit)
    bonus = super
    
    div_power = [ profile.div_weapons, profile.div_powers, profile.div_generals,
      profile.div_items('shield'), profile.div_items('helmet'), profile.div_items('armor'),
      profile.div_items('amulet'), profile.div_items('glove'), profile.div_items('boot')
    ].collect{|c| c.nil? ? 0 : (c[:best].nil? ? 0 : c[:best].div_power)}.sum
    case recruit.promote_level_bonus
    when 1..15
      bonus += div_power * ((recruit.promote_level_bonus.to_f + 3.0) / 100.0)
    when 16..General.max_level
      bonus += div_power * 0.18
    end
    return bonus.round()
  end
end
