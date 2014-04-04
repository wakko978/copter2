class Mephistopheles < General
  def has_special_leveling_increment?
    true
  end

  def special_leveling_increment(recruit,stat)
    case recruit.level
    when 1
      return 0
    when 2..4
      return (recruit.level - 1) * 3
    else
      return 9 + (recruit.level - 4)
    end
  end
end