class LilithAndRiku < General
  def attack_bonus(profile,recruit)
    bonus = super
    
    case recruit.promote_level_bonus
    when 1, 2, 3
      bonus += recruit.promote_level_bonus
    when 4..General.max_level
      bonus += step_function(recruit.promote_level_bonus,{pos_index: 1, offset: 3, period: 2})
    end
    return bonus.round()
  end
end
