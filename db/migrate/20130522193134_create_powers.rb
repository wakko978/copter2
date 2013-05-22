class CreatePowers < ActiveRecord::Migration
  def self.up
    create_table :powers do |t|
      t.string :name, :null => false
      t.integer :attack, :defense, :null => false
      t.float :e_attack, :e_defense, :null => false
      t.integer :base_cost, :upkeep, :limit => 8
      t.attachment :avatar

      t.timestamps
    end
  end

  def self.down
    drop_table :powers
  end
end
