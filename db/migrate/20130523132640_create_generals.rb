class CreateGenerals < ActiveRecord::Migration
  def self.up
    create_table :generals do |t|
      t.string :name, :null => false
      t.integer :attack, :defense, :null => false
      t.float :e_attack, :e_defense, :null => false
      t.integer :base_cost, :upkeep, :limit => 8
      t.integer :attack_increment, :defense_increment, :default => 1
      t.integer :div_power
      t.string :description
      t.attachment :avatar

      t.timestamps
    end
  end

  def self.down
    drop_table :generals
  end
end
