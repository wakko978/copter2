class Zeventis < General
  def attack_bonus(profile,recruit)
    bonus = super
    
    count = profile.inventory_count('items','Obsidian Swords') / 10
    case recruit.promote_level_bonus
    when 1
      bonus += (count * 0.25) > 50 ? 50 : (count * 0.25)
    when 2
      bonus += (count * 0.5) > 50 ? 50 : (count * 0.5)
    when 3
      bonus += (count * 0.75) > 50 ? 50 : (count * 0.75)
    when 4
      bonus += count > 50 ? 50 : count
    when 5..General.max_level
      max = step_function(recruit.promote_level_bonus,{pos_index: 38, multiplier: 3, offset: 4, period: 3})
      bonus += count > max ? max : count
    end
    return bonus.round()
  end
end
