class CreateGearBonuses < ActiveRecord::Migration
  def up
    add_column :weapons, :general_id, :integer
    add_column :weapons, :bonus_type, :string
    add_column :weapons, :bonus, :integer, :default => 0
    add_column :items, :general_id, :integer
    add_column :items, :bonus_type, :string
    add_column :items, :bonus, :integer, :default => 0
    add_column :powers, :general_id, :integer
    add_column :powers, :bonus_type, :string
    add_column :powers, :bonus, :integer, :default => 0
  end

  def down
    remove_column :weapons, :general_id
    remove_column :weapons, :bonus_type
    remove_column :weapons, :bonus
    remove_column :items, :general_id
    remove_column :items, :bonus_type
    remove_column :items, :bonus
    remove_column :powers, :general_id
    remove_column :powers, :bonus_type
    remove_column :powers, :bonus
  end
end