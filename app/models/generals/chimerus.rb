class Chimerus < General
  def attack_bonus(profile,recruit)
    bonus = super
    
    case recruit.promote_level_bonus
    when 1
      bonus += 2
    when 2
      bonus += 3
    when 3
      bonus += 6
    when 4
      mod = step_function(recruit.promote_level_bonus,{pos_index: 6, offset: 3, period:2})
      bonus += mod
    end
    return bonus.round()
  end
end
