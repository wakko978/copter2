class RevertOneMore < ActiveRecord::Migration
  def up
    General.transaction do
      ## Aethyx
      Weapon.find_by_name('Inoculator').update_attributes(general: General.find_by_name('Aethyx'), bonus_type: 'attack', bonus: 1)
      Item::Glove.find_by_name('Poisons Touch').update_attributes(general: General.find_by_name('Aethyx'), bonus_type: 'attack', bonus: 1)
      Item::Armor.find_by_name('Robe of the Fang').update_attributes(general: General.find_by_name('Aethyx'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Aethyx').update_attribute(:type,'General')
    end
  end

  def down
  end
end
