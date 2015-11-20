class AddBannersToLoadouts < ActiveRecord::Migration
  def self.up
    add_column :loadouts, :attack_rune_on_banner, :boolean, default: false
    add_column :loadouts, :banner_id, :integer
    add_column :loadouts, :banner_piercing, :integer, default: 0
    add_column :loadouts, :banner_resistance, :integer, default: 0
  end

  def self.down
  end
end
