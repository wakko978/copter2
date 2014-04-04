class AddMoreBonusItems < ActiveRecord::Migration
  def up
    General.transaction do
      ## Adaya
      Item::Amulet.find_by_name('Eye of Adaya').update_attributes(general: General.find_by_name('Adaya'), bonus_type: 'energy', bonus: 3)
    
      ## Adriana
      Item::Amulet.find_by_name('Skullstone Relic').update_attributes(general: General.find_by_name('Adriana'), bonus_type: 'crit', bonus: 2)
    
      ## Aegea
      Item::Amulet.find_by_name('Serpentkiss Pendant').update_attributes(general: General.find_by_name('Aegea'), bonus_type: 'stamina', bonus: 6)
    
      ## Aeris
      Item::Amulet.find_by_name('Faerie Band').update_attributes(general: General.find_by_name('Aeris'), bonus_type: 'energy', bonus: 5)

      ## Aesir
      Item::Amulet.find_by_name('Stormfury Ring').update_attributes(general: General.find_by_name('Aesir'), bonus_type: 'stamina', bonus: 6)
    
      ## Alexandria
      Power.find_by_name('Souls Embrace').update_attributes(general: General.find_by_name('Alexandria'), bonus_type: 'stamina', bonus: 4)
    
      ## Amon
      Item::Helmet.find_by_name('Demonwalkers Crown').update_attributes(general: General.find_by_name('Amon'), bonus_type: 'energy', bonus: 6)

      ## Annika
      Weapon.find_by_name('Devarian Knives').update_attributes(general: General.find_by_name('Annika'), bonus_type: 'energy', bonus: 10)
    
      ## Anwar
      Item::Amulet.find_by_name('Wildwalker Necklace').update_attributes(general: General.find_by_name('Anwar'), bonus_type: 'energy', bonus: 2)
      Weapon.find_by_name('Wildwalker Staff').update_attributes(general: General.find_by_name('Anwar'), bonus_type: 'crit', bonus: 1)
    
      ## Anya
      Item::Amulet.find_by_name('Heartfire Pendant').update_attributes(general: General.find_by_name('Anya'), bonus_type: 'energy', bonus: 4)
    
      ## Aria
      Item::Amulet.find_by_name('Grimshaw Jewel').update_attributes(general: General.find_by_name('Aria'), bonus_type: 'energy', bonus: 1)
    
      ## Attilius
      Item::Boot.find_by_name('Desolation Treads').update_attributes(general: General.find_by_name('Attilius'), bonus_type: 'stamina', bonus: 5)
    
      ## Azalia
      Item::Armor.find_by_name('Archmage Robes').update_attributes(general: General.find_by_name('Azalia'), bonus_type: 'crit', bonus: 1)
    
      ## Azriel
      Item::Amulet.find_by_name('Signet of Azriel').update_attributes(general: General.find_by_name('Azriel'), bonus_type: 'other', bonus: 1)
    
      ## Azul
      Item::Glove.find_by_name('Hand of Justice').update_attributes(general: General.find_by_name('Azul'), bonus_type: 'crit', bonus: 1)
    
      ## Bacalou
      Item::Amulet.find_by_name('Totem Necklace').update_attributes(general: General.find_by_name('Bacalou'), bonus_type: 'energy', bonus: 3)
    
      ## Barbarus
      Item::Helmet.find_by_name('Wrathbringer Helm').update_attributes(general: General.find_by_name('Barbarus'), bonus_type: 'crit', bonus: 1)
    
      ## Celesta
      Weapon.find_by_name('Celestas Devotion').update_attributes(general: General.find_by_name('Celesta'), bonus_type: 'crit', bonus: 3)
    
      ## Crissana
      Item::Amulet.find_by_name('Trigon Necklace').update_attributes(general: General.find_by_name('Crissana'), bonus_type: 'stamina', bonus: 4)
    
      ## Dante
      Item::Glove.find_by_name('Gauntlet of Fire').update_attributes(general: General.find_by_name('Dante'), bonus_type: 'stamina', bonus: 2)
    
      ## Daphne
      Item::Helmet.find_by_name('Guardian Helm').update_attributes(general: General.find_by_name('Daphne'), bonus_type: 'energy', bonus: 5)
    
      ## Darius
      Item::Helmet.find_by_name('Crown of Darius').update_attributes(general: General.find_by_name('Darius'), bonus_type: 'stamina', bonus: 2)
      Item::Armor.find_by_name('Terran Plate').update_attributes(general: General.find_by_name('Darius'), bonus_type: 'health', bonus: 8)
      Power.find_by_name('Mark of the Wolf').update_attributes(general: General.find_by_name('Darius'), bonus_type: 'energy', bonus: 2)
      Item::Glove.find_by_name('Mythril Fists').update_attributes(general: General.find_by_name('Darius'), bonus_type: 'energy', bonus: 3)
      Item::Amulet.find_by_name('Wolfwood Amulet').update_attributes(general: General.find_by_name('Darius'), bonus_type: 'crit', bonus: 1)
    
      ## Dawn
      Item::Boot.find_by_name('Priestess Treads').update_attributes(general: General.find_by_name('Dawn'), bonus_type: 'energy', bonus: 8)
    
      ## Deianira
      Weapon.find_by_name('Festivus Sword').update_attributes(general: General.find_by_name('Celesta'), bonus_type: 'health', bonus: 9)
    
      ## Delfina Cloudslayer
      Item::Amulet.find_by_name('Cloudslayer Pendant').update_attributes(general: General.find_by_name('Delfina Cloudslayer'), bonus_type: 'stamina', bonus: 2)
    
      ## Deshara
      Item::Amulet.find_by_name('Shadowfel Pendant').update_attributes(general: General.find_by_name('Deshara'), bonus_type: 'crit', bonus: 1)
    
      ## Dexter
      Item::Helmet.find_by_name('Retribution Helm').update_attributes(general: General.find_by_name('Dexter'), bonus_type: 'other', bonus: 1)
    
      ## Draconius
      Item::Helmet.find_by_name('Drakken Helm').update_attributes(general: General.find_by_name('Draconius'), bonus_type: 'energy', bonus: 3)
    
      ## Elena
      Weapon.find_by_name('Crimson Dagger').update_attributes(general: General.find_by_name('Elena'), bonus_type: 'energy', bonus: 3)
    
      ## Elin
      Item::Glove.find_by_name('Gauntlets of Might').update_attributes(general: General.find_by_name('Elin'), bonus_type: 'stamina', bonus: 1)
    
      ## Elizabeth Lione
      Item::Amulet.find_by_name('Ring of Life').update_attributes(general: General.find_by_name('Elizabeth Lione'), bonus_type: 'energy', bonus: 3)
      Weapon.find_by_name('Staff of Vigor').update_attributes(general: General.find_by_name('Elizabeth Lione'), bonus_type: 'stamina', bonus: 4)
    
      ## Elora
      Item::Glove.find_by_name('Tetheryn Glove').update_attributes(general: General.find_by_name('Elora'), bonus_type: 'crit', bonus: 1)
      Item::Amulet.find_by_name('Sharpwind Amulet').update_attributes(general: General.find_by_name('Elora'), bonus_type: 'stamina', bonus: 3)
    
      ## Erynion
      Item::Amulet.find_by_name('Pendant of Oaks').update_attributes(general: General.find_by_name('Erynion'), bonus_type: 'energy', bonus: 10)
    
      ## Esmeralda
      Item::Amulet.find_by_name('Pendant of Aska').update_attributes(general: General.find_by_name('Esmeralda'), bonus_type: 'stamina', bonus: 5)
    
      ## Evalice
      Item::Amulet.find_by_name('Ring of Necrosis').update_attributes(general: General.find_by_name('Evalice'), bonus_type: 'energy', bonus: 5)
    
      ## Excelsior
      Item::Amulet.find_by_name('Conquerors Signet').update_attributes(general: General.find_by_name('Excelsior'), bonus_type: 'health', bonus: 4)
    
      ## Fenris
      Item::Armor.find_by_name('Lycan Armguard').update_attributes(general: General.find_by_name('Fenris'), bonus_type: 'crit', bonus: 1)
      Weapon.find_by_name('Moonclaw').update_attributes(general: General.find_by_name('Fenris'), bonus_type: 'crit', bonus: 1)
    
      ## Feral
      Item::Amulet.find_by_name('Wolf Fang Necklace').update_attributes(general: General.find_by_name('Feral'), bonus_type: 'stamina', bonus: 5)
    
      ## Gallador
      Item::Helmet.find_by_name('Divinity Helm').update_attributes(general: General.find_by_name('Gallador'), bonus_type: 'stamina', bonus: 2)
    
      ## Garlan
      Item::Amulet.find_by_name('Caldonian Band').update_attributes(general: General.find_by_name('Garlan'), bonus_type: 'stamina', bonus: 3)
    
      ## Gawain
      Item::Helmet.find_by_name('Emperion Helm').update_attributes(general: General.find_by_name('Gawain'), bonus_type: 'stamina', bonus: 3)
    
      ## Godric
      Power.find_by_name('Time Shift').update_attributes(general: General.find_by_name('Godric'), bonus_type: 'stamina', bonus: 2)
    
      ## Gorlak
      Item::Amulet.find_by_name('All-seeing Eye').update_attributes(general: General.find_by_name('Gorlak'), bonus_type: 'stamina', bonus: 1)
    
      ## Hyperion
      Item::Glove.find_by_name('Virtue of Temperance').update_attributes(general: General.find_by_name('Hyperion'), bonus_type: 'crit', bonus: 1)
    
      ## Jada
      Item::Amulet.find_by_name('Jadan Signet').update_attributes(general: General.find_by_name('Jada'), bonus_type: 'energy', bonus: 3)
    
      ## Jaelle
      Item::Amulet.find_by_name('Bloodshadow Signet').update_attributes(general: General.find_by_name('Jaelle'), bonus_type: 'energy', bonus: 8)
    
      ## Jera
      Item::Amulet.find_by_name('The Fallen Signet').update_attributes(general: General.find_by_name('Jera'), bonus_type: 'energy', bonus: 8)
    
      ## Kaiser
      Power.find_by_name('Backdraft').update_attributes(general: General.find_by_name('Kaiser'), bonus_type: 'crit', bonus: 1)
    
      ## Kanbe
      Item::Amulet.find_by_name('Recollection').update_attributes(general: General.find_by_name('Kanbe'), bonus_type: 'stamina', bonus: 5)
    
      ## Karn the Minotaur
      Item::Amulet.find_by_name('Pendant of the Bull').update_attributes(general: General.find_by_name('Karn the Minotaur'), bonus_type: 'stamina', bonus: 3)
    
      ## Kataan
      Item::Amulet.find_by_name('Tribal Crest').update_attributes(general: General.find_by_name('Kataan'), bonus_type: 'crit', bonus: 1)
    
      ## Kaylen
      Item::Helmet.find_by_name('Windswept Crown').update_attributes(general: General.find_by_name('Kaylen'), bonus_type: 'crit', bonus: 1)
    
      ## Keira
      Item::Amulet.find_by_name('Signet of Keira').update_attributes(general: General.find_by_name('Keira'), bonus_type: 'other', bonus: 3)
    
      ## Kolrath
      Item::Amulet.find_by_name('Bloodcross').update_attributes(general: General.find_by_name('Kolrath'), bonus_type: 'energy', bonus: 3)
    
      ## Lailah
      Item::Shield.find_by_name('Harmony').update_attributes(general: General.find_by_name('Lailah'), bonus_type: 'other', bonus: 1)
    
      ## Lilith and Riku
      Item::Helmet.find_by_name('Glacial Helm').update_attributes(general: General.find_by_name('Lilith and Riku'), bonus_type: 'energy', bonus: 3)
    
      ## Lotus Ravenmoore
      Item::Amulet.find_by_name('Signet of Lotus').update_attributes(general: General.find_by_name('Lotus Ravenmoore'), bonus_type: 'other', bonus: 30)
    
      ## Lucius
      Weapon.find_by_name('Daedalus').update_attributes(general: General.find_by_name('Lotus Ravenmoore'), bonus_type: 'other', bonus: 0)
      Item::Armor.find_by_name('Argentum Plate').update_attributes(general: General.find_by_name('Lotus Ravenmoore'), bonus_type: 'other', bonus: 0)
      Item::Helmet.find_by_name('Argentum Helm').update_attributes(general: General.find_by_name('Lotus Ravenmoore'), bonus_type: 'other', bonus: 0)
    
      ## Lyra
      Item::Amulet.find_by_name('Heart of Elos').update_attributes(general: General.find_by_name('Lyra'), bonus_type: 'stamina', bonus: 1)
    
      ## Memnon
      Weapon.find_by_name('Frostfire Staves').update_attributes(general: General.find_by_name('Memnon'), bonus_type: 'other', bonus: 0)
      Item::Armor.find_by_name('Robe of Insight').update_attributes(general: General.find_by_name('Memnon'), bonus_type: 'other', bonus: 0)
      Item::Helmet.find_by_name('Ancient Veil').update_attributes(general: General.find_by_name('Memnon'), bonus_type: 'other', bonus: 0)
    
      ## Mephistopheles
      Item::Glove.find_by_name('Fist of Abaddon').update_attributes(general: General.find_by_name('Mephistopheles'), bonus_type: 'stamina', bonus: 1)
      Item::Amulet.find_by_name('Talisman of Demons').update_attributes(general: General.find_by_name('Mephistopheles'), bonus_type: 'stamina', bonus: 10)
    
      ## Mercedes
      Item::Amulet.find_by_name('Witch Locket').update_attributes(general: General.find_by_name('Mercedes'), bonus_type: 'energy', bonus: 3)
    
      ## Minerva
      Item::Amulet.find_by_name('Illvasan Crest').update_attribute(:type,'Item::Shield')
      Item::Shield.find_by_name('Illvasan Crest').update_attributes(general: General.find_by_name('Minerva'), bonus_type: 'stamina', bonus: 2)
    
      ## Miri Bladebourne
      Item::Glove.find_by_name('Bladebourne Gauntlet').update_attributes(general: General.find_by_name('Miri Bladebourne'), bonus_type: 'crit', bonus: 1)
    
      ## Misa
      Item::Amulet.find_by_name('Battlefield Pendant').update_attributes(general: General.find_by_name('Misa'), bonus_type: 'stamina', bonus: 3)
    
      ## Mischa
      Item::Amulet.find_by_name('Frostwake Signet').update_attributes(general: General.find_by_name('Mischa'), bonus_type: 'health', bonus: 9)
    
      ## Morrigan
      Item::Amulet.find_by_name('Blood Flask').update_attributes(general: General.find_by_name('Morrigan'), bonus_type: 'stamina', bonus: 2)
    
      ## Muse
      Item::Amulet.find_by_name('Signet of Muse').update_attributes(general: General.find_by_name('Muse'), bonus_type: 'stamina', bonus: 6)
    
      ## Nautica
      Weapon.find_by_name('Nautical Trident').update_attributes(general: General.find_by_name('Nautica'), bonus_type: 'attack', bonus: 2)
    
      ## Nax the Blighted
      Power.find_by_name('Warriors Totem').update_attributes(general: General.find_by_name('Nax the Blighted'), bonus_type: 'stamina', bonus: 5)
    
      ## Odin
      Item::Amulet.find_by_name('Swordsman Signet').update_attributes(general: General.find_by_name('Odin'), bonus_type: 'energy', bonus: 5)
      Item::Shield.find_by_name('Heroes Aegis').update_attributes(general: General.find_by_name('Odin'), bonus_type: 'stamina', bonus: 5)
    
      ## Penelope
      Item::Amulet.find_by_name('Faith Amulet').update_attributes(general: General.find_by_name('Penelope'), bonus_type: 'stamina', bonus: 6)
      Item::Shield.find_by_name('Silver Light Training Manual').update_attributes(general: General.find_by_name('Penelope'), bonus_type: 'energy', bonus: 2)
    
      ## Percival
      Weapon.find_by_name('Justice').update_attributes(general: General.find_by_name('Percival'), bonus_type: 'other', bonus: 0)
      Item::Shield.find_by_name('Star Shield').update_attributes(general: General.find_by_name('Percival'), bonus_type: 'other', bonus: 0)
    
      ## Sahar
      Item::Amulet.find_by_name('Apeps Ring').update_attributes(general: General.find_by_name('Sahar'), bonus_type: 'stamina', bonus: 8)
    
      ## Sanna
      Item::Armor.find_by_name('Saintly Robes').update_attributes(general: General.find_by_name('Sanna'), bonus_type: 'health', bonus: 3)
    
      ## Scarlett
      Item::Amulet.find_by_name('Magicite Locket').update_attributes(general: General.find_by_name('Scarlett'), bonus_type: 'energy', bonus: 2)
    
      ## Scourge
      Item::Glove.find_by_name('Nightcraft Gauntlets').update_attributes(general: General.find_by_name('Scourge'), bonus_type: 'crit', bonus: 1)
    
      ## Serene
      Weapon.find_by_name('Serenes Arrow').update_attributes(general: General.find_by_name('Serene'), bonus_type: 'crit', bonus: 1)
    
      ## Severin
      Item::Amulet.find_by_name('Truthseeker Pendant').update_attributes(general: General.find_by_name('Severin'), bonus_type: 'health', bonus: 5)
    
      ## Shino
      Item::Helmet.find_by_name('Swordsman Helm').update_attributes(general: General.find_by_name('Shino'), bonus_type: 'stamina', bonus: 3)
      Item::Armor.find_by_name('Gladiator Plate').update_attributes(general: General.find_by_name('Shino'), bonus_type: 'crit', bonus: 1)
    
      ## Shivak
      Power.find_by_name('Binding Will').update_attributes(general: General.find_by_name('Shivak'), bonus_type: 'stamina', bonus: 5)
    
      ## Skaar Deathrune
      Item::Armor.find_by_name('Deathrune Hellplate').update_attributes(general: General.find_by_name('Skaar Deathrune'), bonus_type: 'crit', bonus: 1)
      Item::Shield.find_by_name('Deathshield').update_attributes(general: General.find_by_name('Skaar Deathrune'), bonus_type: 'stamina', bonus: 2)
    
      ## Slayer
      Item::Glove.find_by_name("Slayer's Embrace").update_attributes(general: General.find_by_name('Slayer'), bonus_type: 'energy', bonus: 1)
    
      ## Solara
      Item::Amulet.find_by_name('Silverlight Seal').update_attributes(general: General.find_by_name('Solara'), bonus_type: 'energy', bonus: 4)
    
      ## Sophia
      Item::Armor.find_by_name('Sophias Battlegarb').update_attributes(general: General.find_by_name('Sophia'), bonus_type: 'energy', bonus: 4)
    
      ## Sorkan
      Item::Amulet.find_by_name('Dragonheart Pendant').update_attributes(general: General.find_by_name('Sorkan'), bonus_type: 'stamina', bonus: 5)
      Item::Boot.find_by_name('Dragonslayer Boots').update_attributes(general: General.find_by_name('Sorkan'), bonus_type: 'energy', bonus: 7)
    
      ## Strider
      Power.find_by_name('Redeeming Light').update_attributes(general: General.find_by_name('Strider'), bonus_type: 'energy', bonus: 5)
    
      ## Suri
      Item::Amulet.find_by_name('Sunstone Crest').update_attributes(general: General.find_by_name('Suri'), bonus_type: 'stamina', bonus: 2)
    
      ## Sylphora
      Item::Helmet.find_by_name('Crimson Circlet').update_attributes(general: General.find_by_name('Sylphora'), bonus_type: 'stamina', bonus: 4)
      Item::Amulet.find_by_name('Rubyfire Necklace').update_attributes(general: General.find_by_name('Sylphora'), bonus_type: 'energy', bonus: 3)
    
      ## Sylvana
      Item::Amulet.find_by_name('Enchanted Lantern').update_attributes(general: General.find_by_name('Sylphora'), bonus_type: 'stamina', bonus: 3)
      Item::Amulet.find_by_name('Signet of Sylvana').update_attributes(general: General.find_by_name('Sylphora'), bonus_type: 'other', bonus: 0)
    
      ## Terra
      Item::Helmet.find_by_name("Terra's Crown").update_attributes(general: General.find_by_name('Terra'), bonus_type: 'energy', bonus: 1)
      Item::Amulet.find_by_name("Terra's Heart").update_attributes(general: General.find_by_name('Terra'), bonus_type: 'crit', bonus: 1)
    
      ## Therian
      Item::Helmet.find_by_name('Silverfist Helm').update_attributes(general: General.find_by_name('Therian'), bonus_type: 'stamina', bonus: 4)
    
      ## Tora
      Item::Amulet.find_by_name('Crescent Amulet').update_attributes(general: General.find_by_name('Tora'), bonus_type: 'energy', bonus: 6)
    
      ## Tyxeros
      Item::Glove.find_by_name('Timewarp Gauntlet').update_attributes(general: General.find_by_name('Tyxeros'), bonus_type: 'stamina', bonus: 4)
    
      ## Vanathan
      Item::Helmet.find_by_name('Lightstead Crown').update_attributes(general: General.find_by_name('Vanathan'), bonus_type: 'stamina', bonus: 6)
    
      ## Vancy
      Item::Boot.find_by_name('Beastbane Greaves').update_attributes(general: General.find_by_name('Vancy'), bonus_type: 'stamina', bonus: 3)
    
      ## Vanquish
      Item::Amulet.find_by_name('Flamestrike Amulet').update_attributes(general: General.find_by_name('Vanquish'), bonus_type: 'energy', bonus: 4)
    
      ## Vincent
      Item::Armor.find_by_name('Crimson Cloak').update_attributes(general: General.find_by_name('Vincent'), bonus_type: 'stamina', bonus:3)
      Item::Amulet.find_by_name('Bloodwell Pendant').update_attributes(general: General.find_by_name('Vincent'), bonus_type: 'energy', bonus:4)
    
      ## Vorenus
      Weapon.find_by_name('Shadow Blades').update_attributes(general: General.find_by_name('Vorenus'), bonus_type: 'other', bonus: 0)
      Item::Amulet.find_by_name('Shadowmoon').update_attributes(general: General.find_by_name('Vorenus'), bonus_type: 'other', bonus: 0)
    
      ## Zarevok
      Item::Shield.find_by_name('Zarevok Defender').update_attributes(general: General.find_by_name('Zarevok'), bonus_type: 'stamina', bonus: 2)
    
      ## Zin
      Item::Helmet.find_by_name('Windstalker Crown').update_attributes(general: General.find_by_name('Zin'), bonus_type: 'energy', bonus: 3)
    
      ## Zolthar
      Item::Amulet.find_by_name('Amulet of Krios').update_attributes(general: General.find_by_name('Zolthar'), bonus_type: 'stamina', bonus: 6)
    
      ## Zurran
      Item::Amulet.find_by_name('Necronic Ring').update_attributes(general: General.find_by_name('Zurran'), bonus_type: 'energy', bonus: 5)
    end
  end

  def down
  end
end
