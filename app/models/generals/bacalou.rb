class Bacalou < General
  def defense_bonus(profile,recruit)
    bonus = super
    
    defense_rune = profile.defense_rune
    case recruit.level
    when 1
      bonus += defense_rune * 0.005
    when 2
      bonus += defense_rune * 0.006
    when 3..General.max_level
      bonus += defense_rune * 0.007
    end
    return bonus.round()
  end
end
