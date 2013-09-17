class RevertSomeGeneralTypes < ActiveRecord::Migration
  def up
    General.transaction do
      ## Adaya
      Weapon.find_by_name('True Flight Bow').update_attributes(general: General.find_by_name('Adaya'), bonus_type: 'attack', bonus: 3)
      Item::Glove.find_by_name('True Flight Glove').update_attributes(general: General.find_by_name('Adaya'), bonus_type: 'defense', bonus: 3)
    
      ## Adriana
      Weapon.find_by_name('Lifebane').update_attributes(general: General.find_by_name('Adriana'), bonus_type: 'attack', bonus: 2)
      Item::Armor.find_by_name('Death Ward').update_attributes(general: General.find_by_name('Adriana'), bonus_type: 'attack', bonus: 2)
      General.find_by_name('Adriana').update_attribute(:type,'General')
    
      ## Aegea
      Weapon.find_by_name('Amazons Warpath').update_attributes(general: General.find_by_name('Aegea'), bonus_type: 'attack', bonus: 1)
      Item::Glove.find_by_name('Wyrmhorn Gauntlets').update_attributes(general: General.find_by_name('Aegea'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Aegea').update_attribute(:type,'General')
    
      ## Aeris
      Weapon.find_by_name('Aeris Dagger').update_attributes(general: General.find_by_name('Aeris'), bonus_type: 'attack', bonus: 5)
      Item::Helmet.find_by_name_and_attack_and_defense('Elven Crown',2,5).update_attributes(general: General.find_by_name('Aeris'), bonus_type: 'defense', bonus: 4)
      General.find_by_name('Aeris').update_attribute(:type,'General')

      ## Aesir
      Weapon.find_by_name('Thundercrash').update_attributes(general: General.find_by_name('Aesir'), bonus_type: 'attack', bonus: 2)
      Item::Armor.find_by_name('Aesirs Battle Armor').update_attributes(general: General.find_by_name('Aesir'), bonus_type: 'defense', bonus: 1)
    
      ## Agamemnon
      Item::Shield.find_by_name('Aegis of Kings').update_attributes(general: General.find_by_name('Agamemnon'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Agamemnon').update_attribute(:type,'General')
    
      ## Alexandria
      Weapon.find_by_name('Staff of Veils').update_attributes(general: General.find_by_name('Alexandria'), bonus_type: 'defense', bonus: 2)
      Item::Shield.find_by_name('Flamewave Tome').update_attributes(general: General.find_by_name('Alexandria'), bonus_type: 'attack', bonus: 1)
      General.find_by_name('Alexandria').update_attribute(:type,'General')
    
      ## Alperon
      General.find_by_name('Alperon').update_attribute(:type,'General')
    
      ## Alyzia
      Weapon.find_by_name('Alyzias Greatsword').update_attributes(general: General.find_by_name('Alyzia'), bonus_type: 'attack', bonus: 1)
      Item::Shield.find_by_name('Alyzias Crest').update_attributes(general: General.find_by_name('Alyzia'), bonus_type: 'defense', bonus: 1)
      Item::Amulet.find_by_name('Alyzias Heirloom').update_attributes(general: General.find_by_name('Alyzia'), bonus_type: 'defense', bonus: 1)
    
      ## Ambrosia
      ## Nothing
    
      ## Ameron
      General.find_by_name('Ameron').update_attribute(:type,'General')
    
      ## Amon
      Power.find_by_name('Infernal Flames').update_attributes(general: General.find_by_name('Amon'), bonus_type: 'attack', bonus: 1)
      Item::Armor.find_by_name('Demonwalkers Armor').update_attributes(general: General.find_by_name('Amon'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Amon').update_attribute(:type,'General')
    
      ## Angelica
      General.find_by_name('Angelica').update_attribute(:type,'General')
    
      ## Annika
      Item::Armor.find_by_name('Devarian Cloak').update_attributes(general: General.find_by_name('Annika'), bonus_type: 'attack', bonus: 2)
      Item::Helmet.find_by_name('Templars Mask').update_attributes(general: General.find_by_name('Annika'), bonus_type: 'defense', bonus: 3)
    
      ## Anwar
      Item::Armor.find_by_name('Wildwalker Tunic').update_attributes(general: General.find_by_name('Anwar'), bonus_type: 'defense', bonus: 1)
    
      ## Anya
      Power.find_by_name('Transfiguration').update_attributes(general: General.find_by_name('Anya'), bonus_type: 'attack', bonus: 2)
      Weapon.find_by_name('Guiding Light').update_attributes(general: General.find_by_name('Anya'), bonus_type: 'defense', bonus: 1)
      General.find_by_name('Anya').update_attribute(:type,'General')
    
      ## Aravoss
      Weapon.find_by_name('Chasm Scythe').update_attributes(general: General.find_by_name('Aravoss'), bonus_type: 'attack', bonus: 2)
      Item::Helmet.find_by_name('Cranial Helm').update_attributes(general: General.find_by_name('Aravoss'), bonus_type: 'defense', bonus: 1)
      Item::Amulet.find_by_name('Skeletal Necklace').update_attributes(general: General.find_by_name('Aravoss'), bonus_type: 'defense', bonus: 1)
    
      ## Araxis
      Weapon.find_by_name('Araxin Blade').update_attributes(general: General.find_by_name('Araxis'), bonus_type: 'attack', bonus: 1)
      Item::Amulet.find_by_name('Armageddon Pendant').update_attributes(general: General.find_by_name('Araxis'), bonus_type: 'attack', bonus: 2)
      Item::Shield.find_by_name('Conflagration Shield').update_attributes(general: General.find_by_name('Araxis'), bonus_type: 'defense', bonus: 1)
      General.find_by_name('Araxis').update_attribute(:type,'General')
    
      ## Aria
      Weapon.find_by_name('Emerald Saber').update_attributes(general: General.find_by_name('Aria'), bonus_type: 'attack', bonus: 1)
      Power.find_by_name('Mind Control').update_attributes(general: General.find_by_name('Aria'), bonus_type: 'defense', bonus: 1)
      General.find_by_name('Aria').update_attribute(:type,'General')
    
      ## Arielle
      Weapon.find_by_name('Blade of Arielle').update_attributes(general: General.find_by_name('Arielle'), bonus_type: 'attack', bonus: 3)
      Item::Armor.find_by_name('Armor of Arielle').update_attributes(general: General.find_by_name('Arielle'), bonus_type: 'defense', bonus: 2)
      Item::Shield.find_by_name('Shield of Arielle').update_attributes(general: General.find_by_name('Arielle'), bonus_type: 'defense', bonus: 1)
    
      ## Artanis
      General.find_by_name('Artanis').update_attribute(:type,'General')
    
      ## Athenia
      ## Nothing
    
      ## Attilius
      Weapon.find_by_name('Bloodstrife').update_attributes(general: General.find_by_name('Attilius'), bonus_type: 'attack', bonus: 4)
      Item::Glove.find_by_name('Desolation Cuffs').update_attributes(general: General.find_by_name('Attilius'), bonus_type: 'defense', bonus: 3)
      General.find_by_name('Attilius').update_attribute(:type,'General')
    
      ## Aurelius
      Item::Armor.find_by_name('Lion Scar Plate').update_attributes(general: General.find_by_name('Aurelius'), bonus_type: 'defense', bonus: 1)
    
      ## Aurora
      ## Nothing
    
      ## Axxon
      Weapon.find_by_name('Whirling Blade').update_attributes(general: General.find_by_name('Axxon'), bonus_type: 'attack', bonus: 2)
      Item::Amulet.find_by_name('Blade Charm').update_attributes(general: General.find_by_name('Axxon'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Axxon').update_attribute(:type,'General')
    
      ## Azalia
      Weapon.find_by_name('Prismatic Staff').update_attributes(general: General.find_by_name('Azalia'), bonus_type: 'attack', bonus: 1)
      Item::Armor.find_by_name('Archmage Robes').update_attributes(general: General.find_by_name('Azalia'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Azalia').update_attribute(:type,'General')
    
      ## Azeron
      General.find_by_name('Azeron**').update_attribute(:type,'General')
    
      ## Azorah
      Weapon.find_by_name('Blindfaith Blade').update_attributes(general: General.find_by_name('Azorah'), bonus_type: 'attack', bonus: 2)
      Weapon.find_by_name('Pristine Chakram').update_attributes(general: General.find_by_name('Azorah'), bonus_type: 'attack', bonus: 3)
      Item::Shield.find_by_name('Pristine Shield').update_attributes(general: General.find_by_name('Azorah'), bonus_type: 'defense', bonus: 2)
      Item::Armor.find_by_name('Pristine Plate').update_attributes(general: General.find_by_name('Azorah'), bonus_type: 'defense', bonus: 4)
    
      ## Azriel
      Power.find_by_name('Angelic Rebirth').update_attributes(general: General.find_by_name('Azriel'), bonus_type: 'attack', bonus: 2)
      Power.find_by_name('Angels Crusade').update_attributes(general: General.find_by_name('Azriel'), bonus_type: 'defense', bonus: 5)
    
      ## Azul
      Weapon.find_by_name('Atonement').update_attributes(general: General.find_by_name('Azul'), bonus_type: 'attack', bonus: 1)
      Item::Shield.find_by_name('Absolution').update_attributes(general: General.find_by_name('Azul'), bonus_type: 'defense', bonus: 2)
    
      ## Bacalou
      Power.find_by_name('Shadows Curse').update_attributes(general: General.find_by_name('Bacalou'), bonus_type: 'attack', bonus: 3)
      Weapon.find_by_name('Staff of Curses').update_attributes(general: General.find_by_name('Bacalou'), bonus_type: 'attack', bonus: 2)
    
      ## Banthus Archfiend
      General.find_by_name('Banthus Archfiend').update_attribute(:type,'General')
    
      ## Barbarus
      Weapon.find_by_name('Deathbellow').update_attributes(general: General.find_by_name('Barbarus'), bonus_type: 'attack', bonus: 2)
      Item::Shield.find_by_name('Warmonger Shield').update_attributes(general: General.find_by_name('Barbarus'), bonus_type: 'attack', bonus: 2)
      General.find_by_name('Barbarus').update_attribute(:type,'General')
    
      ## Bjorin
      Weapon.find_by_name('Skullseeker').update_attributes(general: General.find_by_name('Bjorin'), bonus_type: 'attack', bonus: 2)
      Item::Helmet.find_by_name('Valdonian War Helm').update_attributes(general: General.find_by_name('Bjorin'), bonus_type: 'defense', bonus: 1)
      Item::Armor.find_by_name('Valdonian War Armor').update_attributes(general: General.find_by_name('Bjorin'), bonus_type: 'defense', bonus: 1)
    
      ## Brakus
      Weapon.find_by_name('Fenix Blade').update_attributes(general: General.find_by_name('Brakus'), bonus_type: 'attack', bonus: 2)
      Item::Glove.find_by_name('Burning Bracers').update_attributes(general: General.find_by_name('Brakus'), bonus_type: 'attack', bonus: 2)
      Item::Helmet.find_by_name('Fenix Rising').update_attributes(general: General.find_by_name('Brakus'), bonus_type: 'defense', bonus: 2)
    
      ## Caine
      Weapon.find_by_name('The Terrible').update_attributes(general: General.find_by_name('Caine'), bonus_type: 'attack', bonus: 1)
      Item::Armor.find_by_name('Diamondsoul Plate').update_attributes(general: General.find_by_name('Caine'), bonus_type: 'defense', bonus: 1)
      Item::Shield.find_by_name('Remnant Shield').update_attributes(general: General.find_by_name('Caine'), bonus_type: 'defense', bonus: 1)
      General.find_by_name('Caine').update_attribute(:type,'General')
    
      ## Callista
      ## Nothing
    
      ## Cartigan
      ## Nothing
    
      ## Celesta
      ## Nothing
    
      ## Charlotte
      Weapon.find_by_name('True Eye Bow').update_attributes(general: General.find_by_name('Charlotte'), bonus_type: 'attack', bonus: 1)
      Item::Glove.find_by_name('True Eye Gauntlet').update_attributes(general: General.find_by_name('Charlotte'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Charlotte').update_attribute(:type,'General')
    
      ## Chase
      Item::Amulet.find_by_name('Chase Family Heirloom').update_attributes(general: General.find_by_name('Chase'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Chase').update_attribute(:type,'General')
    
      ## Chimerus
      Weapon.find_by_name('Hellblade').update_attributes(general: General.find_by_name('Chimerus'), bonus_type: 'attack', bonus: 5)
    
      ## Cid
      Weapon.find_by_name('Cid Saber').update_attributes(general: General.find_by_name('Cid'), bonus_type: 'attack', bonus: 2)
      Item::Helmet.find_by_name('Cid Helm').update_attributes(general: General.find_by_name('Cid'), bonus_type: 'defense', bonus: 3)
      General.find_by_name('Cid').update_attribute(:type,'General')
    
      ## Corvintheus
      ## Nothing
    
      ## Crissana
      Weapon.find_by_name('Scytheblade').update_attributes(general: General.find_by_name('Crissana'), bonus_type: 'attack', bonus: 1)
      Item::Shield.find_by_name('Vindicator Shield').update_attributes(general: General.find_by_name('Crissana'), bonus_type: 'defense', bonus: 1)
    
      ## Crom
      Item::Armor.find_by_name('Belt of Abaddon').update_attributes(general: General.find_by_name('Crom'), bonus_type: 'attack', bonus: 2)
      General.find_by_name('Crom').update_attribute(:type,'General')
    
      ## Dante
      Weapon.find_by_name('Fiery Blade').update_attributes(general: General.find_by_name('Dante'), bonus_type: 'attack', bonus: 2)
      Power.find_by_name('Breath of Fire').update_attributes(general: General.find_by_name('Dante'), bonus_type: 'attack', bonus: 1)
      Item::Shield.find_by_name('Shield of Dante').update_attributes(general: General.find_by_name('Dante'), bonus_type: 'defense', bonus: 3)
    
      ## Daphne
      Weapon.find_by_name('Lightguard Rapier').update_attributes(general: General.find_by_name('Daphne'), bonus_type: 'attack', bonus: 1)
      Item::Armor.find_by_name('Innocence').update_attributes(general: General.find_by_name('Daphne'), bonus_type: 'defense', bonus: 1)
      General.find_by_name('Daphne').update_attribute(:type,'General')
    
      ## Darius
      Weapon.find_by_name('Crushing Blade').update_attributes(general: General.find_by_name('Darius'), bonus_type: 'attack', bonus: 1)
      Item::Shield.find_by_name('Aegis of Earth').update_attributes(general: General.find_by_name('Darius'), bonus_type: 'defense', bonus: 1)
      General.find_by_name('Darius').update_attribute(:type,'General')
    
      ## Dawn
      Weapon.find_by_name('Shimmering Blade').update_attributes(general: General.find_by_name('Dawn'), bonus_type: 'attack', bonus: 2)
      Item::Shield.find_by_name('Aegis of Dawn').update_attributes(general: General.find_by_name('Dawn'), bonus_type: 'defense', bonus: 4)
      General.find_by_name('Dawn').update_attribute(:type,'General')
    
      ## Deianira
      General.find_by_name('Deianira').update_attribute(:type,'General')
    
      ## Deimos
      Weapon.find_by_name('Berserker Scythe').update_attributes(general: General.find_by_name('Deimos'), bonus_type: 'attack', bonus: 3)
      Item::Helmet.find_by_name('Berserker Bonehelm').update_attributes(general: General.find_by_name('Deimos'), bonus_type: 'attack', bonus: 2)
      Item::Glove.find_by_name('Berserker Gauntlets').update_attributes(general: General.find_by_name('Deimos'), bonus_type: 'defense', bonus: 3)
      Item::Armor.find_by_name('Berserker Hide').update_attributes(general: General.find_by_name('Deimos'), bonus_type: 'defense', bonus: 3)
      General.find_by_name('Deimos').update_attribute(:type,'General')
    
      ## Delfina Cloudslayer
      Weapon.find_by_name('Cloudslayer Blade').update_attributes(general: General.find_by_name('Delfina Cloudslayer'), bonus_type: 'attack', bonus: 2)
      Item::Glove.find_by_name('Cloudslayer Gauntlet').update_attributes(general: General.find_by_name('Delfina Cloudslayer'), bonus_type: 'defense', bonus: 1)
    
      ## Deshara
      Weapon.find_by_name('Shadowfel Katara').update_attributes(general: General.find_by_name('Deshara'), bonus_type: 'attack', bonus: 1)
      Item::Armor.find_by_name('Shadowfel Cloak').update_attributes(general: General.find_by_name('Deshara'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Deshara').update_attribute(:type,'General')
    
      ## Dexter
      Weapon.find_by_name("Gorlak's Axe").update_attributes(general: General.find_by_name('Dexter'), bonus_type: 'attack', bonus: 1)
      Item::Armor.find_by_name_and_attack_and_defense('Retribution Plate',8,11).update_attributes(general: General.find_by_name('Dexter'), bonus_type: 'defense', bonus: 1)
    
      ## Dexter the Drunk
      ## Nothing
    
      ## Dolomar
      Power.find_by_name('Arcane Vortex').update_attributes(general: General.find_by_name('Dolomar'), bonus_type: 'attack', bonus: 1)
      Item::Shield.find_by_name('Forsaken Tome').update_attributes(general: General.find_by_name('Dolomar'), bonus_type: 'attack', bonus: 1)
      Item::Armor.find_by_name('Magus Plate').update_attributes(general: General.find_by_name('Dolomar'), bonus_type: 'defense', bonus: 1)
      General.find_by_name('Dolomar').update_attribute(:type,'General')
    
      ## Draconius
      Weapon.find_by_name('Drakken Blade').update_attributes(general: General.find_by_name('Draconius'), bonus_type: 'attack', bonus: 3)
      Item::Armor.find_by_name('Drakken Plate').update_attributes(general: General.find_by_name('Draconius'), bonus_type: 'defense', bonus: 2)
    
      ## Dragan
      Weapon.find_by_name('Draganblade').update_attributes(general: General.find_by_name('Dragan'), bonus_type: 'attack', bonus: 3)
      Item::Shield.find_by_name('Dragan Protector').update_attributes(general: General.find_by_name('Dragan'), bonus_type: 'defense', bonus: 5)
      General.find_by_name('Dragan').update_attribute(:type,'General')
    
      ## Edea
      Weapon.find_by_name('Mystical Dagger').update_attributes(general: General.find_by_name('Edea'), bonus_type: 'attack', bonus: 3)
      Item::Armor.find_by_name('Mystic Robe').update_attributes(general: General.find_by_name('Edea'), bonus_type: 'defense', bonus: 3)
      General.find_by_name('Edea').update_attribute(:type,'General')
    
      ## Elaida
      Weapon.find_by_name('Path of the Tower').update_attributes(general: General.find_by_name('Elaida'), bonus_type: 'attack', bonus: 2)
      Item::Helmet.find_by_name('Crown of Deliverance').update_attributes(general: General.find_by_name('Elaida'), bonus_type: 'defense', bonus: 1)
      Item::Amulet.find_by_name('Ivory Tower Insignia').update_attributes(general: General.find_by_name('Elaida'), bonus_type: 'defense', bonus: 1)
      General.find_by_name('Elaida').update_attribute(:type,'General')
    
      ## Elena
      General.find_by_name('Elena').update_attribute(:type,'General')
    
      ## Elin
      Weapon.find_by_name('Sword of Might').update_attributes(general: General.find_by_name('Elin'), bonus_type: 'attack', bonus: 1)
      Item::Shield.find_by_name('Shield of Might').update_attributes(general: General.find_by_name('Elin'), bonus_type: 'defense', bonus: 1)
    
      ## Elizabeth Lione
      Item::Shield.find_by_name('Silverlight Tome').update_attributes(general: General.find_by_name('Elizabeth Lione'), bonus_type: 'defense', bonus: 3)
      General.find_by_name('Elizabeth Lione').update_attribute(:type,'General')
    
      ## Elora
      Weapon.find_by_name('Golden Horn Bow').update_attributes(general: General.find_by_name('Elora'), bonus_type: 'attack', bonus: 2)
    
      ## Elyvita
      Weapon.find_by_name('Vale Dagger').update_attributes(general: General.find_by_name('Elyvita'), bonus_type: 'attack', bonus: 4)
      Item::Glove.find_by_name('Vale Bracers').update_attributes(general: General.find_by_name('Elyvita'), bonus_type: 'defense', bonus: 2)
      Item::Amulet.find_by_name('Vale Necklace').update_attributes(general: General.find_by_name('Elyvita'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Elyvita').update_attribute(:type,'General')
    
      ## Ender
      Weapon.find_by_name('Spirit Render').update_attributes(general: General.find_by_name('Ender'), bonus_type: 'attack', bonus: 2)
      Item::Armor.find_by_name('Ancient Deathplate').update_attributes(general: General.find_by_name('Ender'), bonus_type: 'defense', bonus: 1)
      Item::Glove.find_by_name('Necrosis Gauntlets').update_attributes(general: General.find_by_name('Ender'), bonus_type: 'defense', bonus: 1)
    
      ## Ephraline
      Weapon.find_by_name('Conjurers Wand').update_attributes(general: General.find_by_name('Ephraline'), bonus_type: 'attack', bonus: 1)
      Power.find_by_name('Mystical Illusion').update_attributes(general: General.find_by_name('Ephraline'), bonus_type: 'attack', bonus: 1)
      Item::Amulet.find_by_name('Phantasmal Brooch').update_attributes(general: General.find_by_name('Ephraline'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Ephraline').update_attribute(:type,'General')
    
      ## Erynion
      Weapon.find_by_name('Woodwind Staff').update_attributes(general: General.find_by_name('Erynion'), bonus_type: 'attack', bonus: 2)
      Item::Armor.find_by_name('Deepforest Tunic').update_attributes(general: General.find_by_name('Erynion'), bonus_type: 'defense', bonus: 1)
    
      ## Esmeralda
      Weapon.find_by_name('Vanishing Dagger').update_attributes(general: General.find_by_name('Esmeralda'), bonus_type: 'attack', bonus: 2)
      Power.find_by_name('Ephemeral Shadows').update_attributes(general: General.find_by_name('Esmeralda'), bonus_type: 'defense', bonus: 1)
      General.find_by_name('Esmeralda').update_attribute(:type,'General')
    
      ## Eternal Alystra
      Weapon.find_by_name('Heros War Bow').update_attributes(general: General.find_by_name('Eternal Alystra'), bonus_type: 'attack', bonus: 2)
      Item::Amulet.find_by_name('Gladiators Signet').update_attributes(general: General.find_by_name('Eternal Alystra'), bonus_type: 'attack', bonus: 1)
      Item::Glove.find_by_name('Vanguards Gauntlets').update_attributes(general: General.find_by_name('Eternal Alystra'), bonus_type: 'attack', bonus: 3)
      Item::Armor.find_by_name('Brawlers Armor').update_attributes(general: General.find_by_name('Eternal Alystra'), bonus_type: 'defense', bonus: 1)
      Item::Helmet.find_by_name('Swordsman Circlet').update_attributes(general: General.find_by_name('Eternal Alystra'), bonus_type: 'defense', bonus: 2)
      Item::Boot.find_by_name('Warriors Greaves').update_attributes(general: General.find_by_name('Eternal Alystra'), bonus_type: 'defense', bonus: 3)
    
      ## Evalice
      Weapon.find_by_name('Witching Wand').update_attributes(general: General.find_by_name('Evalice'), bonus_type: 'attack', bonus: 1)
      Power.find_by_name('Dark Arcane Field').update_attributes(general: General.find_by_name('Evalice'), bonus_type: 'attack', bonus: 1)
      Item::Amulet.find_by_name('Deathwatch Amulet').update_attributes(general: General.find_by_name('Evalice'), bonus_type: 'defense', bonus: 1)
    
      ## Excelsior
      Weapon.find_by_name('Conquerors Spear').update_attributes(general: General.find_by_name('Excelsior'), bonus_type: 'attack', bonus: 2)
      General.find_by_name('Excelsior').update_attribute(:type,'General')
    
      ## Felizia
      General.find_by_name('Felizia').update_attribute(:type,'General')
    
      ## Fenris
      ## Nothing
    
      ## Feral
      Weapon.find_by_name('Moonstake Staff').update_attributes(general: General.find_by_name('Feral'), bonus_type: 'attack', bonus: 2)
      Item::Glove.find_by_name('Lycan Shackles').update_attributes(general: General.find_by_name('Feral'), bonus_type: 'defense', bonus: 1)
    
      ## Feredir
      Weapon.find_by_name('Flayer Swords').update_attributes(general: General.find_by_name('Feredir'), bonus_type: 'attack', bonus: 2)
      Item::Armor.find_by_name('Windsilk Tunic').update_attributes(general: General.find_by_name('Feredir'), bonus_type: 'defense', bonus: 1)
      Item::Helmet.find_by_name('Windwhisper Hood').update_attributes(general: General.find_by_name('Feredir'), bonus_type: 'defense', bonus: 1)
    
      ## Flaminius
      Weapon.find_by_name('Flamewaker').update_attributes(general: General.find_by_name('Flaminius'), bonus_type: 'attack', bonus: 2)
    
      ## Frost
      Weapon.find_by_name('Chillstrike').update_attributes(general: General.find_by_name('Frost'), bonus_type: 'attack', bonus: 2)
      Item::Helmet.find_by_name('Helm of Winter').update_attributes(general: General.find_by_name('Frost'), bonus_type: 'defense', bonus: 1)
      Item::Armor.find_by_name('Plate of Glaciers').update_attributes(general: General.find_by_name('Frost'), bonus_type: 'defense', bonus: 2)
    
      ## Gabrielle
      Item::Shield.find_by_name('Angelic Aegis').update_attributes(general: General.find_by_name('Gabrielle'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Gabrielle').update_attribute(:type,'General')
    
      ## Gale
      Weapon.find_by_name('Galeforce Bow').update_attributes(general: General.find_by_name('Gale'), bonus_type: 'attack', bonus: 2)
      Item::Armor.find_by_name('Cloudsilk Cloak').update_attributes(general: General.find_by_name('Gale'), bonus_type: 'defense', bonus: 2)
      Item::Glove.find_by_name('Windmaster Gauntlet').update_attributes(general: General.find_by_name('Gale'), bonus_type: 'defense', bonus: 1)
    
      ## Gallador
      Weapon.find_by_name('Divinity Mace').update_attributes(general: General.find_by_name('Gallador'), bonus_type: 'attack', bonus: 1)
      Item::Armor.find_by_name('Divinity Plate').update_attributes(general: General.find_by_name('Gallador'), bonus_type: 'defense', bonus: 3)
    
      ## Garlan
      Weapon.find_by_name('Caldonian Blade').update_attributes(general: General.find_by_name('Garlan'), bonus_type: 'attack', bonus: 3)
      Item::Armor.find_by_name('Garlans Battlegear').update_attributes(general: General.find_by_name('Garlan'), bonus_type: 'defense', bonus: 5)
      Item::Helmet.find_by_name('Galvanized Helm').update_attributes(general: General.find_by_name('Garlan'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Garlan').update_attribute(:type,'General')
    
      ## Gawain
      Weapon.find_by_name('Emperion Sword').update_attributes(general: General.find_by_name('Gawain'), bonus_type: 'attack', bonus: 1)
      Item::Armor.find_by_name('Emperion Plate').update_attributes(general: General.find_by_name('Gawain'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Gawain').update_attribute(:type,'General')
    
      ## Godric
      Weapon.find_by_name('Rift Blade').update_attributes(general: General.find_by_name('Godric'), bonus_type: 'attack', bonus: 2)
      Item::Armor.find_by_name('Spellweaver Cloak').update_attributes(general: General.find_by_name('Godric'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Godric').update_attribute(:type,'General')
    
      ## Gorlak
      Weapon.find_by_name("Gorlak's Cudgel").update_attributes(general: General.find_by_name('Gorlak'), bonus_type: 'attack', bonus: 1)
      Item::Armor.find_by_name('Ogre Raiments').update_attributes(general: General.find_by_name('Gorlak'), bonus_type: 'defense', bonus: 1)
    
      ## Halcyon
      Weapon.find_by_name('Halcyon Grinder').update_attributes(general: General.find_by_name('Halcyon'), bonus_type: 'attack', bonus: 2)
      Item::Glove.find_by_name('Halcyon Glove').update_attributes(general: General.find_by_name('Halcyon'), bonus_type: 'defense', bonus: 2)
    
      ## Helena
      ## Nothing
    
      ## Hyacinth
      General.find_by_name('Hyacinth').update_attribute(:type,'General')
    
      ## Hyperion
      Weapon.find_by_name('Virtue of Justice').update_attributes(general: General.find_by_name('Hyperion'), bonus_type: 'attack', bonus: 1)
      Item::Helmet.find_by_name('Virtue of Fortitude').update_attributes(general: General.find_by_name('Hyperion'), bonus_type: 'defense', bonus: 1)
      General.find_by_name('Hyperion').update_attribute(:type,'General')
    
      ## Illusia
      ## Nothing
    
      ## Isidra
      Weapon.find_by_name('Kingsguard Blade').update_attributes(general: General.find_by_name('Isidra'), bonus_type: 'attack', bonus: 1)
      Item::Helmet.find_by_name('Kingsguard Helm').update_attributes(general: General.find_by_name('Isidra'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Isidra').update_attribute(:type,'General')
    
      ## Isolde
      ## Nothing
    
      ## Jada
      Weapon.find_by_name('Jadan Wand').update_attributes(general: General.find_by_name('Jada'), bonus_type: 'attack', bonus: 1)
      Item::Armor.find_by_name('Jadan Robes').update_attributes(general: General.find_by_name('Jada'), bonus_type: 'defense', bonus: 1)
    
      ## Jaelle
      Weapon.find_by_name('Blood Drinker').update_attributes(general: General.find_by_name('Jaelle'), bonus_type: 'attack', bonus: 1)
      Item::Armor.find_by_name('Bloodshadow Robes').update_attributes(general: General.find_by_name('Jaelle'), bonus_type: 'defense', bonus: 1)
      General.find_by_name('Jaelle').update_attribute(:type,'General')
    
      ## Jahanna
      Weapon.find_by_name('Staff of Jahanna').update_attributes(general: General.find_by_name('Jahanna'), bonus_type: 'attack', bonus: 2)
    
      ## Jera
      Weapon.find_by_name('The Fallen Spear').update_attributes(general: General.find_by_name('Jera'), bonus_type: 'attack', bonus: 6)
      Item::Glove.find_by_name('The Fallen Bracers').update_attributes(general: General.find_by_name('Jera'), bonus_type: 'attack', bonus: 2)
      Item::Helmet.find_by_name('The Fallen Crown').update_attributes(general: General.find_by_name('Jera'), bonus_type: 'defense', bonus: 4)
      General.find_by_name('Jera').update_attribute(:type,'General')
    
      ## Jezale
      Weapon.find_by_name('Bleeding Heart').update_attributes(general: General.find_by_name('Jezale'), bonus_type: 'attack', bonus: 4)
      Item::Amulet.find_by_name('Shadowmeld').update_attributes(general: General.find_by_name('Jezale'), bonus_type: 'attack', bonus: 2)
      Item::Shield.find_by_name('Smokescreen').update_attributes(general: General.find_by_name('Jezale'), bonus_type: 'defense', bonus: 4)
      General.find_by_name('Jezale').update_attribute(:type,'General')
    
      ## Joan
      Weapon.find_by_name('Breaker Lance').update_attributes(general: General.find_by_name('Joan'), bonus_type: 'attack', bonus: 2)
      Item::Helmet.find_by_name('Commander Helm').update_attributes(general: General.find_by_name('Joan'), bonus_type: 'defense', bonus: 1)
      Item::Armor.find_by_name('Crusaders Regalia').update_attributes(general: General.find_by_name('Joan'), bonus_type: 'defense', bonus: 1)
      General.find_by_name('Joan').update_attribute(:type,'General')
    
      ## Kaiser
      Weapon.find_by_name('Death Dealer').update_attributes(general: General.find_by_name('Kaiser'), bonus_type: 'attack', bonus: 2)
      Weapon.find_by_name('Ornate Dagger').update_attributes(general: General.find_by_name('Kaiser'), bonus_type: 'attack', bonus: 2)
      General.find_by_name('Kaiser').update_attribute(:type,'General')
    
      ## Kanbe
      Weapon.find_by_name('Sunder').update_attributes(general: General.find_by_name('Kanbe'), bonus_type: 'attack', bonus: 2)
      Item::Boot.find_by_name('Gaia Boots').update_attributes(general: General.find_by_name('Kanbe'), bonus_type: 'attack', bonus: 5)
      Item::Glove.find_by_name('Gaia Bracer').update_attributes(general: General.find_by_name('Kanbe'), bonus_type: 'attack', bonus: 1)
      Item::Armor.find_by_name('Gaia Armor').update_attributes(general: General.find_by_name('Kanbe'), bonus_type: 'defense', bonus: 1)
      Item::Helmet.find_by_name('Gaia Helm').update_attributes(general: General.find_by_name('Kanbe'), bonus_type: 'defense', bonus: 1)
      Item::Shield.find_by_name('Gaia Shield').update_attributes(general: General.find_by_name('Kanbe'), bonus_type: 'defense', bonus: 1)
    
      ## Kang
      Item::Glove.find_by_name('Monks Bracers').update_attributes(general: General.find_by_name('Kang'), bonus_type: 'attack', bonus: 3)
      Item::Amulet.find_by_name('Monks Ring').update_attributes(general: General.find_by_name('Kang'), bonus_type: 'attack', bonus: 3)
      Item::Armor.find_by_name('Monks Vestments').update_attributes(general: General.find_by_name('Kang'), bonus_type: 'defense', bonus: 3)
      Item::Boot.find_by_name('Monks Slippers').update_attributes(general: General.find_by_name('Kang'), bonus_type: 'defense', bonus: 3)
      General.find_by_name('Kang').update_attribute(:type,'General')
    
      ## Karn the Minotaur
      Weapon.find_by_name('Skullcrush Mace').update_attributes(general: General.find_by_name('Karn the Minotaur'), bonus_type: 'attack', bonus: 1)
      Item::Armor.find_by_name('Minotaurs Battle Armor').update_attributes(general: General.find_by_name('Karn the Minotaur'), bonus_type: 'defense', bonus: 1)
      General.find_by_name('Karn the Minotaur').update_attribute(:type,'General')
    
      ## Kataan
      Weapon.find_by_name('The Disembowler').update_attributes(general: General.find_by_name('Kataan'), bonus_type: 'attack', bonus: 2)
      Item::Armor.find_by_name('Hunters Raiments').update_attributes(general: General.find_by_name('Kataan'), bonus_type: 'defense', bonus: 2)
    
      ## Kaylen
      Weapon.find_by_name('Stormwind Saber').update_attributes(general: General.find_by_name('Kaylen'), bonus_type: 'attack', bonus: 2)
      Item::Armor.find_by_name('Azure Armor').update_attributes(general: General.find_by_name('Kaylen'), bonus_type: 'defense', bonus: 2)
    
      ## Keira
      Power.find_by_name('Demon Strength').update_attributes(general: General.find_by_name('Keira'), bonus_type: 'attack', bonus: 2)
    
      ## Kendra
      Weapon.find_by_name('Water Dancer').update_attributes(general: General.find_by_name('Kendra'), bonus_type: 'defense', bonus: 2)
      Item::Helmet.find_by_name('Koralan Defender').update_attributes(general: General.find_by_name('Kendra'), bonus_type: 'defense', bonus: 2)
      Power.find_by_name('Serpent Spirits').update_attributes(general: General.find_by_name('Kendra'), bonus_type: 'defense', bonus: 2)
    
      ## Kilgore
      Item::Armor.find_by_name('Strength of Oaks').update_attributes(general: General.find_by_name('Kilgore'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Kilgore').update_attribute(:type,'General')
    
      ## Kitsune
      Item::Amulet.find_by_name('Band of Frostmight').update_attributes(general: General.find_by_name('Kitsune'), bonus_type: 'attack', bonus: 1)
      Item::Amulet.find_by_name('Band of Firemight').update_attributes(general: General.find_by_name('Kitsune'), bonus_type: 'defense', bonus: 1)
      Power.find_by_name('Frostfire').update_attributes(general: General.find_by_name('Kitsune'), bonus_type: 'attack', bonus: 2)
    
      ## Kobo
      ## Nothing
    
      ## Kolrath
      Weapon.find_by_name('Bloodcleave').update_attributes(general: General.find_by_name('Kolrath'), bonus_type: 'attack', bonus: 3)
      Item::Helmet.find_by_name('Bloodlords Helm').update_attributes(general: General.find_by_name('Kolrath'), bonus_type: 'defense', bonus: 4)
      Item::Armor.find_by_name('Bloodlords Plate').update_attributes(general: General.find_by_name('Kolrath'), bonus_type: 'defense', bonus: 3)
    
      ## Kothas
      Weapon.find_by_name('Lightward Greatsword').update_attributes(general: General.find_by_name('Kothas'), bonus_type: 'attack', bonus: 2)
      Item::Shield.find_by_name('Crossgate Shield').update_attributes(general: General.find_by_name('Kothas'), bonus_type: 'defense', bonus: 1)
      Item::Glove.find_by_name('Lightward Gauntlet').update_attributes(general: General.find_by_name('Kothas'), bonus_type: 'defense', bonus: 1)
      General.find_by_name('Kothas').update_attribute(:type,'General')
    
      ## Kraxus
      ## Nothing
    
      ## Krystalia
      Weapon.find_by_name('Crystallite Mace').update_attributes(general: General.find_by_name('Krystalia'), bonus_type: 'attack', bonus: 4)
      Item::Glove.find_by_name('Crystallite Gauntlets').update_attributes(general: General.find_by_name('Krystalia'), bonus_type: 'defense', bonus: 4)
      Item::Helmet.find_by_name('Crystallite Helm').update_attributes(general: General.find_by_name('Krystalia'), bonus_type: 'defense', bonus: 3)
      Item::Armor.find_by_name('Crystallite Plate').update_attributes(general: General.find_by_name('Krystalia'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Krystalia').update_attribute(:type,'General')
    
      ## Kull
      ## Nothing
    
      ## Lailah
      Weapon.find_by_name('Incarnation').update_attributes(general: General.find_by_name('Lailah'), bonus_type: 'attack', bonus: 1)
      Item::Armor.find_by_name('Platinus Armor').update_attributes(general: General.find_by_name('Lailah'), bonus_type: 'defense', bonus: 1)
    
      ## Leon Ironhart
      General.find_by_name('Leon Ironhart').update_attribute(:type,'General')
    
      ## Lilith and Riku
      Weapon.find_by_name('Frost Edge').update_attributes(general: General.find_by_name('Lilith and Riku'), bonus_type: 'attack', bonus: 2)
      Item::Amulet.find_by_name('Thawing Star').update_attributes(general: General.find_by_name('Lilith and Riku'), bonus_type: 'defense', bonus: 2)
    
      ## LotharTheRanger
      General.find_by_name('Lothar the Ranger').update_attribute(:type,'General')
    
      ## Lotus Ravenmoore
      Item::Glove.find_by_name('Death Touch Gauntlet').update_attributes(general: General.find_by_name('Lotus Ravenmoore'), bonus_type: 'attack', bonus: 5)
    
      ## Lucius
      General.find_by_name('Lucius').update_attribute(:type,'General')
    
      ## Lyra
      Weapon.find_by_name('Rune Blade').update_attributes(general: General.find_by_name('Lyra'), bonus_type: 'attack', bonus: 1)
      Item::Shield.find_by_name('Ancient Tome').update_attributes(general: General.find_by_name('Lyra'), bonus_type: 'defense', bonus: 1)
    
      ## Maalvus
      Weapon.find_by_name('Blade of Ursus').update_attributes(general: General.find_by_name('Maalvus'), bonus_type: 'attack', bonus: 2)
      Item::Helmet.find_by_name('Mane of Maalvus').update_attributes(general: General.find_by_name('Maalvus'), bonus_type: 'defense', bonus: 1)
      Item::Armor.find_by_name('Gladiator Raiments').update_attributes(general: General.find_by_name('Maalvus'), bonus_type: 'defense', bonus: 1)
      General.find_by_name('Maalvus').update_attribute(:type,'General')
    
      ## Malekus
      Weapon.find_by_name('Moltensteel Blade').update_attributes(general: General.find_by_name('Malekus**'), bonus_type: 'attack', bonus: 3)
      Weapon.find_by_name('Moltensteel Axe').update_attributes(general: General.find_by_name('Malekus**'), bonus_type: 'attack', bonus: 3)
      Item::Helmet.find_by_name('Conquerors War Helm').update_attributes(general: General.find_by_name('Malekus**'), bonus_type: 'defense', bonus: 4)
    
      ## Marina
      ## Nothing
    
      ## Medius
      Weapon.find_by_name('Genesis Sword').update_attributes(general: General.find_by_name('Medius'), bonus_type: 'attack', bonus: 1)
      Power.find_by_name('Frost Bolt').update_attributes(general: General.find_by_name('Medius'), bonus_type: 'defense', bonus: 1)
    
      ## Meekah
      Weapon.find_by_name('Judicators Wrath').update_attributes(general: General.find_by_name('Meekah'), bonus_type: 'attack', bonus: 1)
      Item::Armor.find_by_name('Conclave Armor').update_attributes(general: General.find_by_name('Meekah'), bonus_type: 'defense', bonus: 1)
      Item::Shield.find_by_name('Judicators Will').update_attributes(general: General.find_by_name('Meekah'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Meekah').update_attribute(:type,'General')
    
      ## Memnon
      ## Nothing
    
      ## Mephistopheles
      Weapon.find_by_name('Brimstone Blade').update_attributes(general: General.find_by_name('Mephistopheles'), bonus_type: 'attack', bonus: 5)
      Item::Glove.find_by_name('Hellflame Bracers').update_attributes(general: General.find_by_name('Mephistopheles'), bonus_type: 'defense', bonus: 3)
      General.find_by_name('Mephistopheles').update_attribute(:type,'General')
    
      ## Mercedes
      General.find_by_name('Mercedes').update_attribute(:type,'General')
    
      ## Minerva
      Weapon.find_by_name('Righteousness').update_attributes(general: General.find_by_name('Minerva'), bonus_type: 'attack', bonus: 2)
      Item::Helmet.find_by_name('Titan Helm').update_attributes(general: General.find_by_name('Minerva'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Minerva').update_attribute(:type,'General')
    
      ## Miri Bladebourne
      Weapon.find_by_name('Bladebourne Saber').update_attributes(general: General.find_by_name('Miri Bladebourne'), bonus_type: 'attack', bonus: 1)
      Item::Armor.find_by_name('Bladebourne Raiments').update_attributes(general: General.find_by_name('Miri Bladebourne'), bonus_type: 'defense', bonus: 1)
      General.find_by_name('Miri Bladebourne').update_attribute(:type,'General')
    
      ## Misa
      Weapon.find_by_name('Crimsonguard Halberd').update_attributes(general: General.find_by_name('Misa'), bonus_type: 'attack', bonus: 1)
      Item::Armor.find_by_name('Crimsonguard Cloak').update_attributes(general: General.find_by_name('Misa'), bonus_type: 'defense', bonus: 1)
      General.find_by_name('Misa').update_attribute(:type,'General')
    
      ## Mischa
      Weapon.find_by_name('Frostwake Wand').update_attributes(general: General.find_by_name('Mischa'), bonus_type: 'attack', bonus: 3)
      Item::Boot.find_by_name('Frostwake Slippers').update_attributes(general: General.find_by_name('Mischa'), bonus_type: 'defense', bonus: 2)
      Item::Armor.find_by_name('Frostwake Robes').update_attributes(general: General.find_by_name('Mischa'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Mischa').update_attribute(:type,'General')
    
      ## Morrigan
      Power.find_by_name('Shadow Blast').update_attributes(general: General.find_by_name('Morrigan'), bonus_type: 'attack', bonus: 3)
      Item::Shield.find_by_name('Nether Tome').update_attributes(general: General.find_by_name('Morrigan'), bonus_type: 'defense', bonus: 3)
      General.find_by_name('Morrigan').update_attribute(:type,'General')
    
      ## Muse
      Weapon.find_by_name('Harp of Styx').update_attributes(general: General.find_by_name('Muse'), bonus_type: 'attack', bonus: 3)
      Item::Helmet.find_by_name('Crown of Muse').update_attributes(general: General.find_by_name('Muse'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Muse').update_attribute(:type,'General')
    
      ## Nautica
      Weapon.find_by_name('Nautical Trident').update_attributes(general: General.find_by_name('Nautica'), bonus_type: 'attack', bonus: 2)
    
      ## Noktar
      ## Nothing
    
      ## Oberon
      Weapon.find_by_name("Oberon's Might").update_attributes(general: General.find_by_name('Oberon'), bonus_type: 'attack', bonus: 1)
      Item::Shield.find_by_name('Crest of the Griffin').update_attributes(general: General.find_by_name('Oberon'), bonus_type: 'defense', bonus: 1)
      Item::Armor.find_by_name('Griffinhyde Armor').update_attributes(general: General.find_by_name('Oberon'), bonus_type: 'defense', bonus: 1)
      General.find_by_name('Oberon').update_attribute(:type,'General')
    
      ## Odin
      Weapon.find_by_name('Gladiators Warstaff').update_attributes(general: General.find_by_name('Odin'), bonus_type: 'attack', bonus: 4)
      Item::Boot.find_by_name('Brawler Boots').update_attributes(general: General.find_by_name('Odin'), bonus_type: 'defense', bonus: 1)
      Item::Helmet.find_by_name('Warriors Helm').update_attributes(general: General.find_by_name('Odin'), bonus_type: 'defense', bonus: 2)
      Item::Armor.find_by_name('Legends Wargear').update_attributes(general: General.find_by_name('Odin'), bonus_type: 'defense', bonus: 4)
    
      ## Ophelia
      ## Nothing
    
      ## Orc King
      General.find_by_name('Orc King').update_attribute(:type,'General')
    
      ## Penelope
      Weapon.find_by_name('Scepter of Light').update_attributes(general: General.find_by_name('Penelope'), bonus_type: 'attack', bonus: 3)
      General.find_by_name('Penelope').update_attribute(:type,'General')
    
      ## Percival
      ## Nothing
    
      ## Persephone
      General.find_by_name('Persephone').update_attribute(:type,'General')
    
      ## Phaethor
      General.find_by_name('Phaethor').update_attribute(:type,'General')
    
      ## Rafaria
      Weapon.find_by_name('Shadow Slicer').update_attributes(general: General.find_by_name('Rafaria'), bonus_type: 'attack', bonus: 1)
      Item::Amulet.find_by_name('Terror Pendant').update_attributes(general: General.find_by_name('Rafaria'), bonus_type: 'defense', bonus: 1)
      Item::Armor.find_by_name('Shadowclasp Cloak').update_attributes(general: General.find_by_name('Rafaria'), bonus_type: 'defense', bonus: 1)
      General.find_by_name('Rafaria').update_attribute(:type,'General')
    
      ## Ravendor
      Weapon.find_by_name('Raven Blight').update_attributes(general: General.find_by_name('Ravendor'), bonus_type: 'attack', bonus: 2)
      Power.find_by_name('Ravens Grasp').update_attributes(general: General.find_by_name('Ravendor'), bonus_type: 'attack', bonus: 2)
      Item::Armor.find_by_name('Nalzir Robes').update_attributes(general: General.find_by_name('Ravendor'), bonus_type: 'defense', bonus: 2)
    
      ## Raziel the Silent
      Weapon.find_by_name('The Galvanizer').update_attributes(general: General.find_by_name('Raziel the Silent'), bonus_type: 'attack', bonus: 4)
      Item::Armor.find_by_name('Terrorshard Armor').update_attributes(general: General.find_by_name('Raziel the Silent'), bonus_type: 'defense', bonus: 2)
      Item::Amulet.find_by_name('Amulet of Shadows').update_attributes(general: General.find_by_name('Raziel the Silent'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Raziel the Silent').update_attribute(:type,'General')
    
      ## Reinhardt
      Weapon.find_by_name('Exorcist Cross').update_attributes(general: General.find_by_name('Reinhardt'), bonus_type: 'attack', bonus: 1)
      Item::Armor.find_by_name('Crossguard Plate').update_attributes(general: General.find_by_name('Reinhardt'), bonus_type: 'defense', bonus: 2)
    
      ## Sahar
      Weapon.find_by_name('Sahars Scimitar').update_attributes(general: General.find_by_name('Sahar'), bonus_type: 'attack', bonus: 5)
      Item::Helmet.find_by_name('Sahars Headdress').update_attributes(general: General.find_by_name('Sahar'), bonus_type: 'defense', bonus: 5)
    
      ## Sanna
      Weapon.find_by_name('Staff of the Martyr').update_attributes(general: General.find_by_name('Sanna'), bonus_type: 'attack', bonus: 1)
      Item::Amulet.find_by_name('Crusaders Cross').update_attributes(general: General.find_by_name('Sanna'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Sanna').update_attribute(:type,'General')
    
      ## Sano
      Weapon.find_by_name('Bonecrusher').update_attributes(general: General.find_by_name('Sano'), bonus_type: 'attack', bonus: 2)
      Item::Armor.find_by_name('Lava Plate').update_attributes(general: General.find_by_name('Sano'), bonus_type: 'defense', bonus: 2)
      Item::Shield.find_by_name('Shield of Sano').update_attributes(general: General.find_by_name('Sano'), bonus_type: 'defense', bonus: 1)
      General.find_by_name('Sano').update_attribute(:type,'General')
    
      ## Savannah
      General.find_by_name('Savannah').update_attribute(:type,'General')
    
      ## Scarlett
      Weapon.find_by_name('Crystalline Rod').update_attributes(general: General.find_by_name('Scarlett'), bonus_type: 'defense', bonus: 2)
      Item::Armor.find_by_name('Carmine Robes').update_attributes(general: General.find_by_name('Scarlett'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Scarlett').update_attribute(:type,'General')
    
      ## Scourge
      Item::Armor.find_by_name('Nightcraft Plate').update_attributes(general: General.find_by_name('Scourge'), bonus_type: 'defense', bonus: 1)
    
      ## Sephora
      General.find_by_name('Sephora').update_attribute(:type,'General')
    
      ## Serene
      ## Nothing
    
      ## Serra Silverlight
      ## Nothing
    
      ## Serylius
      ## Nothing
    
      ## Severin
      Weapon.find_by_name('Truthseeker Blade').update_attributes(general: General.find_by_name('Severin'), bonus_type: 'attack', bonus: 1)
      Item::Helmet.find_by_name('Devout Helm').update_attributes(general: General.find_by_name('Severin'), bonus_type: 'defense', bonus: 1)
      General.find_by_name('Severin').update_attribute(:type,'General')
    
      ## Shino
      Weapon.find_by_name('Frostwolf Axe').update_attributes(general: General.find_by_name('Shino'), bonus_type: 'attack', bonus: 1)
      Item::Glove.find_by_name('Warrior Gauntlet').update_attributes(general: General.find_by_name('Shino'), bonus_type: 'attack', bonus: 8)
      Power.find_by_name('Whirlwind').update_attributes(general: General.find_by_name('Shino'), bonus_type: 'attack', bonus: 3)
      Item::Amulet.find_by_name('Hero Insignia').update_attributes(general: General.find_by_name('Shino'), bonus_type: 'defense', bonus: 8)
    
      ## Shivak
      Weapon.find_by_name('Prophetic Wand').update_attributes(general: General.find_by_name('Shivak'), bonus_type: 'attack', bonus: 1)
      Item::Amulet.find_by_name('Ring of Prophets').update_attributes(general: General.find_by_name('Shivak'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Shivak').update_attribute(:type,'General')
    
      ## Skaar Deathrune
      Item::Amulet.find_by_name('Deathrune Signet').update_attributes(general: General.find_by_name('Skaar Deathrune'), bonus_type: 'attack', bonus: 4)
    
      ## Slayer
      Weapon.find_by_name('Vampiric Blade').update_attributes(general: General.find_by_name('Slayer'), bonus_type: 'attack', bonus: 1)
      Item::Armor.find_by_name('Blood Vestment').update_attributes(general: General.find_by_name('Slayer'), bonus_type: 'defense', bonus: 1)
      General.find_by_name('Slayer').update_attribute(:type,'General')
    
      ## Sofira
      General.find_by_name('Sofira').update_attribute(:type,'General')
    
      ## Solara
      Weapon.find_by_name('Solstice Blade').update_attributes(general: General.find_by_name('Solara'), bonus_type: 'attack', bonus: 2)
      Item::Shield.find_by_name('Seraphim Shield').update_attributes(general: General.find_by_name('Solara'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Solara').update_attribute(:type,'General')
    
      ## Sophia
      Weapon.find_by_name('Arcane Bow').update_attributes(general: General.find_by_name('Sophia'), bonus_type: 'attack', bonus: 6)
      Weapon.find_by_name('Cursed Bow').update_attributes(general: General.find_by_name('Sophia'), bonus_type: 'attack', bonus: -5)
      General.find_by_name('Sophia').update_attribute(:type,'General')
    
      ## Sorkan
      Weapon.find_by_name('Dragoncleave').update_attributes(general: General.find_by_name('Sorkan'), bonus_type: 'attack', bonus: 3)
      Item::Helmet.find_by_name('Dragontooth Helm').update_attributes(general: General.find_by_name('Sorkan'), bonus_type: 'defense', bonus: 2)
      Item::Armor.find_by_name('Dragonslayer Armor').update_attributes(general: General.find_by_name('Sorkan'), bonus_type: 'defense', bonus: 3)
    
      ## Stone Guardian
      General.find_by_name('Stone Guardian').update_attribute(:type,'General')
    
      ## Strider
      Weapon.find_by_name('Assassins Blade').update_attributes(general: General.find_by_name('Strider'), bonus_type: 'attack', bonus: 3)
      Item::Amulet.find_by_name('Amulet of Despair').update_attributes(general: General.find_by_name('Strider'), bonus_type: 'attack', bonus: 2)
      Item::Armor.find_by_name('Assassins Cloak').update_attributes(general: General.find_by_name('Strider'), bonus_type: 'defense', bonus: 5)
      General.find_by_name('Strider').update_attribute(:type,'General')
    
      ## Suri
      Weapon.find_by_name('Windthorn Wand').update_attributes(general: General.find_by_name('Suri'), bonus_type: 'attack', bonus: 2)
      Item::Helmet.find_by_name('Gilded Tiara').update_attributes(general: General.find_by_name('Suri'), bonus_type: 'defense', bonus: 2)
    
      ## Sylphora
      Weapon.find_by_name('Dagger of Sacrifice').update_attributes(general: General.find_by_name('Sylphora'), bonus_type: 'attack', bonus: 2)
      Item::Armor.find_by_name('Bloodmagi Robes').update_attributes(general: General.find_by_name('Sylphora'), bonus_type: 'defense', bonus: 3)
      General.find_by_name('Sylphora').update_attribute(:type,'General')
    
      ## Sylvana
      ## Nothing
    
      ## Syren
      Weapon.find_by_name('Syrens Call').update_attributes(general: General.find_by_name('Syren'), bonus_type: 'attack', bonus: 1)
      Power.find_by_name('Discombobulate').update_attributes(general: General.find_by_name('Syren'), bonus_type: 'attack', bonus: 1)
      Item::Amulet.find_by_name('Temptations Lure').update_attributes(general: General.find_by_name('Syren'), bonus_type: 'defense', bonus: 1)
      General.find_by_name('Syren').update_attribute(:type,'General')
    
      ## Tefaera
      Weapon.find_by_name('Staff of Prayers').update_attributes(general: General.find_by_name('Tefaera'), bonus_type: 'attack', bonus: 2)
      Item::Helmet.find_by_name('Circlet of Light').update_attributes(general: General.find_by_name('Tefaera'), bonus_type: 'defense', bonus: 1)
      Item::Amulet.find_by_name('Praetors Seal').update_attributes(general: General.find_by_name('Tefaera'), bonus_type: 'defense', bonus: 1)
      General.find_by_name('Tefaera').update_attribute(:type,'General')
    
      ## Terra
      Weapon.find_by_name("Terra's Blade").update_attributes(general: General.find_by_name('Terra'), bonus_type: 'attack', bonus: 3)
      Item::Shield.find_by_name("Terra's Guard").update_attributes(general: General.find_by_name('Terra'), bonus_type: 'defense', bonus: 3)
      General.find_by_name('Terra').update_attribute(:type,'General')
    
      ## Theorin
      General.find_by_name('Theorin').update_attribute(:type,'General')
    
      ## Therian
      Weapon.find_by_name('Silverfist Hammer').update_attributes(general: General.find_by_name('Therian'), bonus_type: 'attack', bonus: 1)
      Item::Armor.find_by_name('Silverfist Plate').update_attributes(general: General.find_by_name('Therian'), bonus_type: 'defense', bonus: 1)
    
      ## Tifanna
      General.find_by_name('Tifanna').update_attribute(:type,'General')
    
      ## Titania
      Weapon.find_by_name('Titania Bow').update_attributes(general: General.find_by_name('Titania'), bonus_type: 'attack', bonus: 3)
      General.find_by_name('Titania').update_attribute(:type,'General')
    
      ## Tora
      Weapon.find_by_name('Crescent Staff').update_attributes(general: General.find_by_name('Tora'), bonus_type: 'attack', bonus: 2)
      Item::Helmet.find_by_name('Crescent Helm').update_attributes(general: General.find_by_name('Tora'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Tora').update_attribute(:type,'General')
    
      ## Tristram
      ## Nothing
    
      ## Tyrant
      Weapon.find_by_name('Gatekeeper Blade').update_attributes(general: General.find_by_name('Tyrant'), bonus_type: 'attack', bonus: 2)
      Item::Helmet.find_by_name('Demonguard Helm').update_attributes(general: General.find_by_name('Tyrant'), bonus_type: 'defense', bonus: 1)
      Item::Armor.find_by_name('Demonguard Plate').update_attributes(general: General.find_by_name('Tyrant'), bonus_type: 'defense', bonus: 1)
      General.find_by_name('Tyrant').update_attribute(:type,'General')
    
      ## Tyxeros
      Weapon.find_by_name('Chaos Staff').update_attributes(general: General.find_by_name('Tyxeros'), bonus_type: 'attack', bonus: 1)
      Item::Armor.find_by_name('Chaos Armor').update_attributes(general: General.find_by_name('Tyxeros'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Tyxeros').update_attribute(:type,'General')
    
      ## Valiant
      General.find_by_name('Valiant').update_attribute(:type,'General')
    
      ## Vanathan
      Weapon.find_by_name('Lightstrike Sword').update_attributes(general: General.find_by_name('Vanathan'), bonus_type: 'attack', bonus: 3)
      Item::Armor.find_by_name('Lightstead Plate').update_attributes(general: General.find_by_name('Vanathan'), bonus_type: 'defense', bonus: 4)
    
      ## Vancy
      Weapon.find_by_name('Beastbane Axe').update_attributes(general: General.find_by_name('Vancy'), bonus_type: 'attack', bonus: 3)
      Item::Armor.find_by_name('Beastbane Plate').update_attributes(general: General.find_by_name('Vancy'), bonus_type: 'defense', bonus: 3)
    
      ## Vanir
      Item::Amulet.find_by_name('Sunvale Choker').update_attributes(general: General.find_by_name('Vanir'), bonus_type: 'attack', bonus: 1)
      Weapon.find_by_name('Force Ward Staff').update_attributes(general: General.find_by_name('Vanir'), bonus_type: 'defense', bonus: 1)
      Item::Armor.find_by_name('Protectorate Plate').update_attributes(general: General.find_by_name('Vanir'), bonus_type: 'defense', bonus: 2)
    
      ## Vanquish
      Weapon.find_by_name('Bloodblade').update_attributes(general: General.find_by_name('Vanquish'), bonus_type: 'attack', bonus: 1)
      Power.find_by_name('Wrath of Vanquish').update_attributes(general: General.find_by_name('Vanquish'), bonus_type: 'attack', bonus: 2)
    
      ## Vincent
      Weapon.find_by_name('Exsanguinator').update_attributes(general: General.find_by_name('Vincent'), bonus_type: 'attack', bonus: 1)
      Item::Armor.find_by_name('Bloodlord Plate').update_attributes(general: General.find_by_name('Vincent'), bonus_type: 'defense', bonus: 1)
      General.find_by_name('Vincent').update_attribute(:type,'General')
    
      ## Vorenus
      General.find_by_name('Vorenus').update_attribute(:type,'General')
    
      ## Vulcan
      ## Nothing
    
      ## Xelia
      Item::Amulet.find_by_name('Signet from Beyond').update_attributes(general: General.find_by_name('Xelia'), bonus_type: 'attack', bonus: 2)
      Weapon.find_by_name('Deceivers Wand').update_attributes(general: General.find_by_name('Xelia'), bonus_type: 'defense', bonus: 1)
      Item::Glove.find_by_name('Phantasmal Armguards').update_attributes(general: General.find_by_name('Xelia'), bonus_type: 'defense', bonus: 1)
      General.find_by_name('Xelia').update_attribute(:type,'General')
    
      ## Xira
      ## Nothing
    
      ## Zarevok
      Weapon.find_by_name('Meat Cleaver').update_attributes(general: General.find_by_name('Zarevok'), bonus_type: 'both', bonus: 3)
      Item::Armor.find_by_name('Zarevok Plate').update_attributes(general: General.find_by_name('Zarevok'), bonus_type: 'defense', bonus: 3)
    
      ## Zeventis
      Weapon.find_by_name('Claymore of Zeventis').update_attributes(general: General.find_by_name('Zeventis'), bonus_type: 'attack', bonus: 2)
      Item::Helmet.find_by_name('Helm of Zeventis').update_attributes(general: General.find_by_name('Zeventis'), bonus_type: 'defense', bonus: 1)
      Item::Armor.find_by_name('Plate of Zeventis').update_attributes(general: General.find_by_name('Zeventis'), bonus_type: 'defense', bonus: 1)
    
      ## Zin
      Weapon.find_by_name('Serenity Blade').update_attributes(general: General.find_by_name('Zin'), bonus_type: 'attack', bonus: 1)
      Item::Shield.find_by_name('Ancient Shield').update_attributes(general: General.find_by_name('Zin'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Zin').update_attribute(:type,'General')
    
      ## Zolthar
      Weapon.find_by_name('Might of Krios').update_attributes(general: General.find_by_name('Zolthar'), bonus_type: 'attack', bonus: 3)
      Item::Armor.find_by_name('Krios Plate').update_attributes(general: General.find_by_name('Zolthar'), bonus_type: 'defense', bonus: 3)
    
      ## Zurran
      Weapon.find_by_name('Soul Siphon').update_attributes(general: General.find_by_name('Zurran'), bonus_type: 'attack', bonus: 1)
      Power.find_by_name('Necronic Blast').update_attributes(general: General.find_by_name('Zurran'), bonus_type: 'defense', bonus: 2)
      General.find_by_name('Zurran').update_attribute(:type,'General')
    end
  end

  def down
  end
end
