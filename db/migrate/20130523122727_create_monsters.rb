class CreateMonsters < ActiveRecord::Migration
  def self.up
    create_table :monsters, :force => true do |t|
      t.string :name, :null => false
      t.integer :minutes, :default => 0
      t.string :attack_type
      t.integer :div_power
      t.string :description
      
      t.timestamps
    end
  end

  def self.down
    drop_table :monsters
  end
end