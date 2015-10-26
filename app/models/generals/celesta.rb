class Celesta < General
  def defense_bonus(profile,recruit)
    bonus = super
    
    case recruit.promote_level_bonus
    when 1
      bonus += 1 + 3
    when 2
      bonus += 3 + 5
    when 3
      bonus += 5 + 10
    when 4..General.max_level
      bonus += 15 + (7 * (recruit.promote_level_bonus - 4)).to_i
    end
    return bonus.round()
  end
end
