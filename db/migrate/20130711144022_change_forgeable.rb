class ChangeForgeable < ActiveRecord::Migration
  def change
    change_column :weapons, :forgeable, :integer, :default => 0
    change_column :items, :forgeable, :integer, :default => 0
    rename_column :weapons, :forgeable, :slots
    rename_column :items, :forgeable, :slots
  end
end
