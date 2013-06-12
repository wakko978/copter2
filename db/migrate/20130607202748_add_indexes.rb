class AddIndexes < ActiveRecord::Migration
  def up
    add_index :accessories, [:profile_id,:owned]
    add_index :arms, [:profile_id,:owned]
    add_index :fighters, [:profile_id,:owned]
    add_index :recruits, [:profile_id,:level]
    add_index :spells, [:profile_id,:owned]
    add_index :properties, [:profile_id,:owned]
    add_index :generals, :name
  end
  
  def down
    remove_index :accessories, [:profile_id,:owned]
    remove_index :arms, [:profile_id,:owned]
    remove_index :fighters, [:profile_id,:owned]
    remove_index :recruits, [:profile_id,:level]
    remove_index :spells, [:profile_id,:owned]
    remove_index :properties, [:profile_id,:owned]
  end
end