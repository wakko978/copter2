class PetrusTheElusive < General
  def resistance(recruit)
    case recruit.promote_level_bonus
    when 1..4
      return (recruit.promote_level_bonus + 4)
    else
      return 8 + ((recruit.promote_level_bonus - 4) * 0.5).floor
    end
  end
end
