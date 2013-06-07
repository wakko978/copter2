class AddStiToGenerals < ActiveRecord::Migration
  def change
    add_column :generals, :type, :string, :default => 'General'
  end
end