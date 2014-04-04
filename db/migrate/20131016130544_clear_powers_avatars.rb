class ClearPowersAvatars < ActiveRecord::Migration
  def up
    Power.all.each do |w|
      w.avatar.destroy
    end
    remove_column :powers, :avatar_file_name
    remove_column :powers, :avatar_content_type
    remove_column :powers, :avatar_file_size
    remove_column :powers, :avatar_updated_at
  end

  def down
  end
end
