class VivianTheEternal < General
  def resistance(recruit)
    case recruit.promote_level_bonus
    when 1..6
      return (recruit.promote_level_bonus + 4)
    when 7..14
      return ((recruit.promote_level_bonus - 1) + 4)
    when 15..22
      return ((recruit.promote_level_bonus - 2) + 4)
    when 23..32
      return ((recruit.promote_level_bonus - 3) + 4)
    when 33..41
      return recruit.promote_level_bonus
    when 42..General.max_level
      return recruit.promote_level_bonus - 1
    end
  end
end
