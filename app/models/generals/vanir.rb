class Vanir < General
  def resistance(recruit)
    case recruit.promote_level_bonus
    when 1..4
      return recruit.promote_level_bonus * 10
    else
      return 40 + ((recruit.promote_level_bonus - 4) * 0.5).floor
    end
  end
end
