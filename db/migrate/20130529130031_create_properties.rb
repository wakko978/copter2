class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|
      t.references :profile, :land, :null => false
      t.integer :owned, :default => 0, :null => false
    end
  end

  def self.down
    drop_table :properties
  end
end
