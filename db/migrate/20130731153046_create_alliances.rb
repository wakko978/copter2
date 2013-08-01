class CreateAlliances < ActiveRecord::Migration
  def up
    create_table :alliances, :force => true do |t|
      t.references :profile, :null => false
      t.string :alliance_type, :null => false
      t.integer :primary_link, :secondary_link, :tertiary_link
    end
  end

  def down
    drop_table :alliances
  end
end