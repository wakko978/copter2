class Adaya < General  
  def attack_bonus(profile,recruit)
    bonus = super
    attack_rune = profile.attack_rune
    
    case recruit.level
    when 1
      bonus += attack_rune * 0.05
    when 2
      bonus += attack_rune * 0.06
    when 3
      bonus += attack_rune * 0.07
    when 4
      bonus += attack_rune * 0.08
    when 5..General.max_level
      bonus += attack_rune * 0.09
    end
    
    return bonus.round()
  end
end
