class Bogo < General
  def piercing(recruit,skip_alliance=false)
    case recruit.level
    when 1..7
      return recruit.level + 10
    when 8..12
      return 16
    when 13..14
      return 17
    when 15..19
      return 18
    when 20..22
      return 19
    when 23..27
      return 20
    when 28..30
      return 21
    when 31..35
      return 22
    else
      return 22
    end
  end
end
