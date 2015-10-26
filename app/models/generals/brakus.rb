class Brakus < General
  def piercing(recruit)
    case recruit.promote_level_bonus
    when 1
      return 5
    when 2
      return 15
    when 3
      return 25
    when 4..General.max_level
      return 35 + ((recruit.promote_level_bonus - 4) * 0.5).floor
    end
  end
end
