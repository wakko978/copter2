class CreateLoadouts < ActiveRecord::Migration
  def up
    create_table :loadouts, :force => true do |t|
      t.string :name, :null => false
      t.string :class_type
      t.references :profile, :null => false
      t.references :general, :weapon, :shield, :helmet, :armor, :amulet, :glove, :boot, :power
      t.boolean :attack_rune_on_weapon, :defense_rune_on_helmet, :defense_rune_on_armor, :default => false
      t.integer :weapon_piercing, :weapon_resistance, :glove_piercing, :glove_resistance, :armor_piercing,
        :armor_resistance, :helmet_piercing, :helmet_resistance, :default => 0
    end
  end

  def down
    drop_table :loadouts
  end
end