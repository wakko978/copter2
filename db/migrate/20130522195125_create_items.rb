class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name, :null => false
      t.string :type, :null => false
      t.integer :attack, :defense, :null => false
      t.float :e_attack, :e_defense, :null => false
      t.integer :base_cost, :upkeep, :limit => 8
      t.integer :div_power
      t.boolean :forgeable, :default => false
      t.attachment :avatar

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
