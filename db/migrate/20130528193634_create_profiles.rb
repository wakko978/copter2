class CreateProfiles < ActiveRecord::Migration
  def up
    create_table :profiles, :force => true do |t|
      t.string :name, :null => false
      t.integer :attack, :defense, :energy, :stamina, :health, :level, :army_size, :default => 0, :null => false
      t.integer :attack_rune, :defense_rune, :health_rune, :damage_rune, :attack_ia, :defense_ia, :default => 0, :null => false
      t.float :e_attack, :e_defense, :null => false
      t.float :income_bonus, :default => 1.0
      t.integer :army_bonus, :default => 0
      t.string :cage_id
      t.references :user
      t.attachment :land_file, :general_file, :soldier_file, :item_file, :magic_file
      
      t.timestamps
    end
  end

  def down
    drop_table :profiles
  end
end