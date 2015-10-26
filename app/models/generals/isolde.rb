class Isolde < General
  def defense_bonus(profile,recruit)
    bonus = super
    
    tristram = profile.recruits.includes(:general).where("generals.name = 'Tristram'").first
    case recruit.promote_level_bonus
    when 1
      bonus += 4 if tristram
    when 2
      bonus += 5 if tristram
    when 3
      bonus += 6 if tristram
    when 4
      bonus += 7 if tristram
    when 5..General.max_level
      bonus += (recruit.promote_level_bonus * 2) - 1 if tristram
    end
    return bonus.round()
  end
end
