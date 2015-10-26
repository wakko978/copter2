class Adaya < General  
  def attack_bonus(profile,recruit)
    bonus = super
    attack_rune = profile.attack_rune
    
    case recruit.promote_level_bonus
    when 1..6
      bonus += attack_rune * (0.004 + (recruit.promote_level_bonus * 0.001))
    when 7
      bonus += attack_rune * 0.0125
    when 8..General.max_level
      bonus += attack_rune * (0.0125 + ((recruit.promote_level_bonus - 7) * 0.0015))
    end
    
    return bonus.round()
  end
end
