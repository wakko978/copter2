class AddGeneralTypeToGenerals < ActiveRecord::Migration
  def change
    add_column :generals, :general_type, :string, :default => 'Balanced'
  end
end