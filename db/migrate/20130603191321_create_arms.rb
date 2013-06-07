class CreateArms < ActiveRecord::Migration
  def up
    create_table :arms, :force => true do |t|
      t.references :profile, :weapon, :null => false
      t.integer :owned, :default => 0, :null => false
    end
  end

  def down
    drop_table :arms
  end
end
