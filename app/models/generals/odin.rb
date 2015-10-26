class Odin < General
  def piercing(recruit)
    case recruit.promote_level_bonus
    when 1..4
      return (recruit.promote_level_bonus + 1) * 10
    else
      return 50 + ((recruit.promote_level_bonus - 4) * 0.5).floor
    end
  end
end
