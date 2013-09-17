class Celesta < General
  def defense_bonus(profile,recruit)
    bonus = super
    
    case recruit.level
    when 1
      bonus += 1 + 3
    when 2
      bonus += 3 + 5
    when 3
      bonus += 5 + 10
    when 4..General.max_level
      bonus += 15 + (6.5 * (recruit.level - 4)).to_i
    end
    return bonus.round()
  end
end
