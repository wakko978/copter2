class CreateLands < ActiveRecord::Migration
  def self.up
    create_table :lands do |t|
      t.string :name, :null => false
      t.integer :base_cost, :income, :limit => 8, :null => false
      t.float :incremental_cost, :null => false
      t.attachment :avatar

      t.timestamps
    end
  end

  def self.down
    drop_table :lands
  end
end
