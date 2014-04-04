class ClearItemAvatars < ActiveRecord::Migration
  def up
    Item.all.each do |w|
      w.avatar.destroy
    end
    remove_column :items, :avatar_file_name
    remove_column :items, :avatar_content_type
    remove_column :items, :avatar_file_size
    remove_column :items, :avatar_updated_at
  end

  def down
  end
end
