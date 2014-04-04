class ClearWeaponsAvatars < ActiveRecord::Migration
  def up
    Weapon.all.each do |w|
      w.avatar.destroy
    end
    remove_column :weapons, :avatar_file_name
    remove_column :weapons, :avatar_content_type
    remove_column :weapons, :avatar_file_size
    remove_column :weapons, :avatar_updated_at
  end

  def down
  end
end
