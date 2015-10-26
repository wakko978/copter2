class Katherine < General
  def resistance(recruit)
    case recruit.promote_level_bonus
    when 1..4
      return 25 + ((recruit.promote_level_bonus - 1) * 10)
    else
      return 55 + ((recruit.promote_level_bonus - 4) * 0.5).floor
    end
  end
end
