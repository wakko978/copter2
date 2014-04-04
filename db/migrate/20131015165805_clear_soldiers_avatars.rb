class ClearSoldiersAvatars < ActiveRecord::Migration
  def up
    Soldier.all.each do |w|
      w.avatar.destroy
    end
    remove_column :soldiers, :avatar_file_name
    remove_column :soldiers, :avatar_content_type
    remove_column :soldiers, :avatar_file_size
    remove_column :soldiers, :avatar_updated_at
  end

  def down
  end
end
