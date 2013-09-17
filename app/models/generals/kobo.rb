class Kobo < General
  def has_special_leveling_increment?
    true
  end
  
  def special_leveling_increment(recruit,stat)
    case stat
    when 'attack'
      case recruit.level
      when 1, 2, 3, 4
        return 0
      when 5..General.max_level
        return recruit.level - 4
      end
    when 'defense'
      case recruit.level
      when 1
        return 0
      when 2
        return 5
      when 3
        return 20
      when 4
        return 40
      when 5..General.max_level
        return 40 + (recruit.level - 4)
      end
    end
  end
end
