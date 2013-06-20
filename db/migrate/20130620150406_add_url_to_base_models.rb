class AddUrlToBaseModels < ActiveRecord::Migration
  def change
    add_column :generals, :url, :string
    add_column :soldiers, :url, :string
    add_column :items, :url, :string
    add_column :powers, :url, :string
    add_column :lands, :url, :string
    add_column :weapons, :url, :string
  end
end