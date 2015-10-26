class Tristram < General
  def attack_bonus(profile,recruit)
    bonus = super
    
    isolde = profile.recruits.includes(:general).where("generals.name = 'Isolde'").first
    case recruit.promote_level_bonus
    when 1
      bonus += 4 if isolde
    when 2
      bonus += 5 if isolde
    when 3
      bonus += 6 if isolde
    when 4
      bonus += 7 if isolde
    when 5..General.max_level
      bonus += (recruit.promote_level_bonus * 2) - 1 if isolde
    end
    return bonus.round()
  end
end
