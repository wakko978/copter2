class AddGeneralOwnershipToSoldiersAndGenerals < ActiveRecord::Migration
  def change
    add_column :soldiers, :general_id, :integer
    add_column :soldiers, :bonus_type, :string
    add_column :soldiers, :bonus, :integer, :default => 0
    
    add_column :generals, :general_id, :integer
    add_column :generals, :bonus_type, :string
    add_column :generals, :bonus, :integer, :default => 0
  end
end
