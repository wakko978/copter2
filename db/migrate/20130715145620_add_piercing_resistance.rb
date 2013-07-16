class AddPiercingResistance < ActiveRecord::Migration
  def change
    add_column :generals, :base_piercing, :integer, :default => 0
    add_column :generals, :base_resistance, :integer, :default => 0
    add_column :weapons, :piercing, :integer, :default => 0
    add_column :weapons, :resistance, :integer, :default => 0
    add_column :powers, :piercing, :integer, :default => 0
    add_column :powers, :resistance, :integer, :default => 0
    add_column :items, :piercing, :integer, :default => 0
    add_column :items, :resistance, :integer, :default => 0
  end
end