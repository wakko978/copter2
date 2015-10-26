class Azeron < General
  def has_special_leveling_increment?
    true
  end

  def special_leveling_increment(recruit,stat)
    case recruit.promote_level_bonus
    when 1
      return 0
    when 2
      return 3
    when 3, 4
      return 3 * (recruit.level - 1)
    else
      return 9 + (recruit.level - 4)
    end
  end
end
