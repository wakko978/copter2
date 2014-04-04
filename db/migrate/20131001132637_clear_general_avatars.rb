class ClearGeneralAvatars < ActiveRecord::Migration
  def up
    General.all.each do |g|
      g.avatar.destroy
    end
    remove_column :generals, :avatar_file_name
    remove_column :generals, :avatar_content_type
    remove_column :generals, :avatar_file_size
    remove_column :generals, :avatar_updated_at
    remove_column :lands, :avatar_file_name
    remove_column :lands, :avatar_content_type
    remove_column :lands, :avatar_file_size
    remove_column :lands, :avatar_updated_at
  end

  def down
  end
end
