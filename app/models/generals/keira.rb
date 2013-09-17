class Keira < General
  def defense_bonus(profile,recruit)
    bonus = super
    
    case recruit.level
    when 1
      bonus += (2 * 0.7).to_i
    when 2
      bonus += (4 * 0.7).to_i
    when 3
      bonus += (6 * 0.7).to_i
    when 4
      bonus += (8 * 0.7).to_i
    when 5..General.max_level
      bonus += (8 + (6.5 * (recruit.level - 4)) * 0.7).to_i
    end
    return bonus.round()
  end
end
