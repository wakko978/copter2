class Loadout < ActiveRecord::Base
  belongs_to :profile
  belongs_to :general, :class_name => "Recruit"
  belongs_to :weapon
  belongs_to :power
  belongs_to :shield, :class_name => "Item::Shield"
  belongs_to :helmet, :class_name => "Item::Helmet"
  belongs_to :armor, :class_name => "Item::Armor"
  belongs_to :amulet, :class_name => "Item::Amulet"
  belongs_to :glove, :class_name => "Item::Glove"
  belongs_to :boot, :class_name => "Item::Boot"
  
  attr_accessible :profile_id, :profile, :name, :class_type, :general, :general_id, :weapon, :weapon_id,
    :shield, :shield_id, :helmet, :helmet_id, :armor, :armor_id, :amulet, :amulet_id, :glove, :glove_id, :boot, :boot_id,
    :power, :power_id, :attack_rune_on_weapon, :defense_rune_on_armor, :defense_rune_on_helmet, :weapon_piercing, :weapon_resistance,
    :armor_piercing, :armor_resistance, :helmet_piercing, :helmet_resistance, :shield_piercing, :shield_resistance
  
  validates :name, :presence => :true
  validates :profile_id, :presence => true
  validates :weapon_piercing, :weapon_resistance, :armor_piercing, :armor_resistance, :helmet_piercing, :helmet_resistance,
    :shield_piercing, :shield_resistance, :numericality => { :only_integer => true }
    
  def attack
    [
      profile.attack + profile.attack_ia,
      general.nil? ? 0 : general.monster_bonus_only? ? general.monster_attack : 0,
      general.nil? ? 0 : general.attack,
      weapon.nil? ? 0 : weapon.attack + (attack_rune_on_weapon? ? profile.attack_rune : 0),
      shield.nil? ? 0 : shield.attack,
      helmet.nil? ? 0 : helmet.attack,
      armor.nil? ? 0 : armor.attack,
      amulet.nil? ? 0 : amulet.attack,
      glove.nil? ? 0 : glove.attack,
      boot.nil? ? 0 : boot.attack,
      power.nil? ? 0 : power.attack].sum
  end
  
  def defense
    [
      profile.defense + profile.defense_ia,
      general.nil? ? 0 : general.defense,
      weapon.nil? ? 0 : weapon.defense,
      shield.nil? ? 0 : shield.defense,
      helmet.nil? ? 0 : helmet.defense + (defense_rune_on_helmet? ? profile.defense_rune : 0),
      armor.nil? ? 0 : armor.defense + (defense_rune_on_armor? ? profile.defense_rune : 0),
      amulet.nil? ? 0 : amulet.defense,
      glove.nil? ? 0 : glove.defense,
      boot.nil? ? 0 : boot.defense,
      power.nil? ? 0 : power.defense].sum
  end
  
  def e_attack
    total_piercing = [
      general.nil? ? 0 : general.piercing,
      weapon.nil? ? 0 : weapon.piercing + (weapon_piercing),
      shield.nil? ? 0 : shield.piercing + (shield_piercing),
      helmet.nil? ? 0 : helmet.piercing + (helmet_piercing),
      armor.nil? ? 0 : armor.piercing + (armor_piercing),
      amulet.nil? ? 0 : amulet.piercing,
      glove.nil? ? 0 : glove.piercing,
      boot.nil? ? 0 : boot.piercing,
      power.nil? ? 0 : power.piercing].sum
    (((attack - (general.nil? ? 0 : (general.monster_bonus_only? ? general.monster_attack : 0))) + defense*0.7) * (1 + (total_piercing / 1000.0))).round(1)
  end
  
  def e_defense
    total_resistance = [
      general.nil? ? 0 : general.resistance,
      weapon.nil? ? 0 : weapon.resistance + (weapon_resistance),
      shield.nil? ? 0 : shield.resistance + (shield_resistance),
      helmet.nil? ? 0 : helmet.resistance + (helmet_resistance),
      armor.nil? ? 0 : armor.resistance + (armor_resistance),
      amulet.nil? ? 0 : amulet.resistance,
      glove.nil? ? 0 : glove.resistance,
      boot.nil? ? 0 : boot.resistance,
      power.nil? ? 0 : power.resistance].sum
    ((defense + (attack - (general.nil? ? 0 : (general.monster_bonus_only? ? general.monster_attack : 0)))*0.7) * (1 + (total_resistance / 1000.0))).round(1)
  end
end
