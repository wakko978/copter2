class AddFieldsToLoadouts < ActiveRecord::Migration
  def self.up
    add_column :loadouts, :boot_piercing, :integer, default: 0
    add_column :loadouts, :boot_resistance, :integer, default: 0
    add_column :loadouts, :power_piercing, :integer, default: 0
    add_column :loadouts, :power_resistance, :integer, default: 0
  end

  def self.down
  end
end
