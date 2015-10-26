class Keira < General
  def defense_bonus(profile,recruit)
    bonus = super
    
    case recruit.promote_level_bonus
    when 1
      bonus += (2 * 0.7).to_i
    when 2
      bonus += (4 * 0.7).to_i
    when 3
      bonus += (6 * 0.7).to_i
    when 4
      bonus += (8 * 0.7).to_i
    when 5..General.max_level
      bonus += (8 + (6.5 * (recruit.promote_level_bonus - 4)) * 0.7).to_i
    end
    return bonus.round()
  end
end
