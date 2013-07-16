class AddSlotsData < ActiveRecord::Migration
  def up
    ### Weapons
    Weapon.find_by_sql("SELECT * FROM weapons WHERE (attack + defense) >= 50").each do |w|
      w.update_attribute(:slots,1)
    end
    w = Weapon.find_by_name('Dukes Bone Blade')
    w.update_attribute(:slots,2)
    
    ### Armors
    Item::Armor.find_by_sql("SELECT * FROM items WHERE type = 'Item::Armor' AND (attack + defense) >= 50").each do |a|
      a.update_attribute(:slots,1)
    end
    a = Item::Armor.find_by_name('Commanders Bone Plate')
    a.update_attribute(:slots,2)
    
    ### Helmets
    Item::Helmet.find_by_sql("SELECT * FROM items WHERE type = 'Item::Helmet' AND (attack + defense) >= 50").each do |a|
      a.update_attribute(:slots,1)
    end
    
    ### Gloves
    Item::Glove.find_by_sql("SELECT * FROM items WHERE type = 'Item::Glove' AND (attack + defense) >= 50").each do |a|
      a.update_attribute(:slots,1)
    end
  end

  def down
  end
end
