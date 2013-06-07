class CreateSpells < ActiveRecord::Migration
  def up
    create_table :spells, :force => true do |t|
      t.references :profile, :power, :null => false
      t.integer :owned, :default => 0, :null => false
    end
  end

  def down
    drop_table :spells
  end
end
