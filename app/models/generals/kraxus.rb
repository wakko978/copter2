class Kraxus < General
  def piercing(recruit)
    case recruit.level
    when 1..4
      return (recruit.level + 1) * 10
    else
      return 50
    end
  end
  
  def resistance(recruit)
    case recruit.level
    when 5
      return 10
    when 6
      return 15
    when 7
      return 20
    else
      return 20
    end
  end
end
