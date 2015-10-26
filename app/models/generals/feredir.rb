class Feredir < General
  def piercing(recruit)
    case recruit.promote_level_bonus
    when 1..4
      return recruit.promote_level_bonus * 5
    else
      return 20 + ((recruit.promote_level_bonus - 4) * 0.5).floor
    end
  end
end
