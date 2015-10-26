class Kobo < General
  def has_special_leveling_increment?
    true
  end
  
  def special_leveling_increment(recruit,stat)
    case stat
    when 'attack'
      case recruit.promote_level_bonus
      when 1..7
        return 0
      when 8
        return 3
      when 9..General.max_level
        return recruit.promote_level_bonus - 5
      end
    when 'defense'
      case recruit.promote_level_bonus
      when 1
        return 0
      when 2
        return 5
      when 3
        return 20
      when 4
        return 40
      when 5..General.max_level
        return 40 + (recruit.promote_level_bonus - 4)
      end
    end
  end
end
