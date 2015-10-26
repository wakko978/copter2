class StoneGuardian < General
  def has_special_leveling_increment?
    true
  end

  def special_leveling_increment(recruit,stat)
    case recruit.promote_level_bonus
    when 1
      return 0
    when 2..4
      return (recruit.promote_level_bonus - 1) * 3
    else
      return 9 + (recruit.promote_level_bonus - 4)
    end
  end
end