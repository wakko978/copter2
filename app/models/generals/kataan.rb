class Kataan < General
  def has_special_leveling_increment?
    true
  end
  
  def special_leveling_increment(recruit,stat)
    case recruit.promote_level_bonus
    when 1
      return 0
    when 2
      return 2
    when 3
      return 4
    when 4..General.max_level
      return 6
    end
  end
end
