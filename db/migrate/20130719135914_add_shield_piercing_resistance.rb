class AddShieldPiercingResistance < ActiveRecord::Migration
  def up
    add_column :loadouts, :shield_piercing, :integer, :default => 0
    add_column :loadouts, :shield_resistance, :integer, :default => 0
  end

  def down
  end
end