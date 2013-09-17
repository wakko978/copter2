class Frost < General
  def piercing(recruit)
    case recruit.level
    when 1..4
      return recruit.level * 5
    else
      return 20
    end
  end
end
