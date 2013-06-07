class CreateAccessories < ActiveRecord::Migration
  def up
    create_table :accessories, :force => true do |t|
      t.references :profile, :item, :null => false
      t.integer :owned, :default => 0, :null => false
    end
  end

  def down
    drop_table :spells
  end
end
