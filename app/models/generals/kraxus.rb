class Kraxus < General
  def piercing(recruit)
    case recruit.promote_level_bonus
    when 1..4
      return (recruit.promote_level_bonus + 1) * 10
    when 5..8
      return 50
    else
      return 50 + ((recruit.promote_level_bonus - 4) * 0.5).floor
    end
  end
  
  def resistance(recruit)
    case recruit.promote_level_bonus
    when 1..4
      return 0
    when 5
      return 10
    when 6
      return 15
    when 7
      return 20
    else
      return 20 + ((recruit.promote_level_bonus - 4) * 0.5).floor
    end
  end
end
