class CreateFighters < ActiveRecord::Migration
  def up
    create_table :fighters, :force => true do |t|
      t.references :profile, :soldier, :null => false
      t.integer :owned, :default => 0, :null => false
    end
  end

  def down
    drop_table :fighters
  end
end