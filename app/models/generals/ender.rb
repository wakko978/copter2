class Ender < General
  def piercing(recruit)
    case recruit.level
    when 1..4
      return (recruit.level + 1) * 10
    else
      return 50
    end
  end
end
