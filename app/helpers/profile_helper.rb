module ProfileHelper
  def attack_sum(collection)
    collection.collect{|f| f.e_attack}.sum
  end
  
  def defense_sum(collection)
    collection.collect{|f| f.e_defense}.sum
  end
  
  def attack_power(collection)
    collection.collect{|f| f.e_attack*f.owned}.sum
  end
  
  def defense_power(collection)
    collection.collect{|f| f.e_defense*f.owned}.sum
  end
  
  def gear_count(collection)
    collection.collect{|f| f.owned}.sum
  end
  
  def gear_sum(collection,stat)
    collection.collect{|f| f["best_#{stat}".to_sym].nil? ? 0 : f["best_#{stat}".to_sym].send("e_#{stat}")}.sum
  end
  
  def acc_cont(type)
    type.gsub(/Item::/,'').downcase.pluralize
  end
  
  def total_attack_power(profile,collections)
    power = 0
    collections.each do |collection|
      power += attack_power(collection)
    end
    power += profile.e_attack * profile.army_in_use    
    return power
  end
  
  def total_defense_power(profile,collections)
    power = 0
    collections.each do |collection|
      power += defense_power(collection)
    end
    power += profile.e_defense * profile.army_in_use
    return power
  end
  
  def total_div_power(collections)
    collections.collect{|c| c.nil? ? 0 : (c[:best].nil? ? 0 : c[:best].div_power)}.sum
  end
end