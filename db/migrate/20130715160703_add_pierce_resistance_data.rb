class AddPierceResistanceData < ActiveRecord::Migration
  def up
    ### Generals
    General.find_by_name('Aesir').update_attribute(:base_piercing,10)
    General.find_by_name('Frost').update_attribute(:base_piercing,5)
    General.find_by_name('Feredir').update_attribute(:base_piercing,5)
    General.find_by_name('Gale').update_attribute(:base_piercing,2)
    General.find_by_name('Aravoss').update_attribute(:base_piercing,2)
    General.find_by_name('Kitsune').update_attribute(:base_piercing,2)
    General.find_by_name('Ender').update_attribute(:base_piercing,20)
    General.find_by_name('Kanbe').update_attribute(:base_piercing,5)
    General.find_by_name('Brakus').update_attribute(:base_piercing,5)
    General.find_by_name('Kraxus').update_attribute(:base_piercing,20)
    General.find_by_name('Annika').update_attribute(:base_piercing,20)
    General.find_by_name('Odin').update_attribute(:base_piercing,20)
    General.find_by_name('Vanir').update_attribute(:base_resistance,10)
    General.find_by_name('Erynion').update_attribute(:base_resistance,10)
    General.find_by_name('Zolthar').update_attribute(:base_resistance,5)
    General.find_by_name('Kendra').update_attribute(:base_resistance,5)
    General.find_by_name('Ravendor').update_attribute(:base_resistance,5)
    General.find_by_name('Vanathan').update_attribute(:base_resistance,20)
    
    ### Weapons
    Weapon.find_by_name('Warbringer Longblade').update_attribute(:piercing,20)
    Weapon.create(name: 'Retribution Hammer', attack: 36, defense: 38, resistance: 10, slots: 1, url: 'http://images.wikia.com/castleage/images/5/53/Retribution_Hammer.jpg')
    
    ### Shields
    Item::Shield.find_by_name('Warbringer Shield').update_attribute(:piercing,10)
    Item::Shield.create(name: 'Retribution Aegis', attack: 45, defense: 55, resistance: 10, slots: 1, url: 'http://images.wikia.com/castleage/images/6/61/Retribution_Aegis.jpg')
    
    ### Helmets
    Item::Helmet.find_by_name('Warbringer Helm').update_attribute(:piercing,10)
    Item::Helmet.create(name: 'Retribution Helm', attack: 55, defense: 63, resistance: 20, slots: 1, url: 'http://images.wikia.com/castleage/images/c/c2/Retribution_Helm_conquest.jpg')
    
    ### Armors
    Item::Armor.find_by_name('Warbringer Plate').update_attribute(:piercing,10)
    Item::Armor.find_by_name('Retribution Plate').update_attribute(:resistance,10)
    
    ### Amulets
    Item::Amulet.find_by_name('Warbringer Pendant').update_attribute(:piercing,10)
    Item::Amulet.find_by_name('Retribution Amulet').update_attribute(:resistance,10)
    
    ### Gloves
    Item::Glove.find_by_name('Warbringer Gauntlets').update_attribute(:piercing,10)
    Item::Glove.find_by_name('Retribution Gauntlets').update_attribute(:resistance,10)
    
    ### Boots
    Item::Boot.find_by_name('Warbringer Greaves').update_attribute(:piercing,10)
    Item::Boot.find_by_name('Retribution Greaves').update_attribute(:resistance,10)
  end

  def down
  end
end