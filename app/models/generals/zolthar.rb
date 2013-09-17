class Zolthar < General
  def resistance(recruit)
    case recruit.level
    when 1
      return 5
    when 2
      return 15
    when 3
      return 25
    else
      return 35
    end
  end
end
