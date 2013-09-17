class Azorah < General
  def defense_bonus(profile,recruit)
    bonus = super
    
    defense_rune = profile.defense_rune
    bonus += defense_rune * (2 + ((recruit.level - 1) * 0.25)) * 0.01
    return bonus.round()
  end
end
