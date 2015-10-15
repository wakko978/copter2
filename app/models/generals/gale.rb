class Gale < General
  def piercing(recruit,skip_alliance=false)
    case recruit.level
    when 1..4
      return recruit.level * 2
    else
      return 8
    end
  end
end
