class CreateRecruits < ActiveRecord::Migration
  def up
    create_table :recruits, :force => true do |t|
      t.references :general, :profile, :null => false
      t.integer :level, :default => 1, :null => false
    end
  end

  def down
  end
end