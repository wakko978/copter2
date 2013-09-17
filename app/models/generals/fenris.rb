class Fenris < General
  def attack_bonus(profile,recruit)
    bonus = super
    
    bonus += 2 if profile.inventory_exists?('items','Wolfbane Trinket')
    
    case recruit.level
    when 1, 2, 3
      bonus += recruit.level + 2
    when 4..General.max_level
      bonus += step_function(recruit.level,{pos_index: 2, offset: 3, period: 2})
    end
    return bonus.round()
  end
end
