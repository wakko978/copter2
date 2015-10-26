class Aesir < General
  def piercing(recruit)
    case recruit.promote_level_bonus
    when 1..4
      return recruit.level * 10
    else
      return 40 + ((recruit.promote_level_bonus - 4) * 0.5).floor
    end
  end
end
