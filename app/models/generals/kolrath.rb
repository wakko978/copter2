class Kolrath < General
  def attack_bonus(profile,recruit)
    bonus = super
    attack_rune = profile.attack_rune

    bonus += attack_rune * (2 + ((recruit.promote_level_bonus - 1) * 0.25)) * 0.01
    return bonus.round()
  end
end
