class Bacalou < General
  def defense_bonus(profile,recruit)
    bonus = super
    defense_rune = profile.defense_rune
    
    bonus = defense_rune * ((recruit.promote_level_bonus + 4) * 0.1)
    return bonus.round()
  end
end
