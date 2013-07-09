class SwitchToCloudinaryCarrierwave < ActiveRecord::Migration
  def up
    remove_column :profiles, :keep_file_file_name
    remove_column :profiles, :keep_file_content_type
    remove_column :profiles, :keep_file_file_size
    remove_column :profiles, :keep_file_updated_at
    
    remove_column :profiles, :general_file_file_name
    remove_column :profiles, :general_file_content_type
    remove_column :profiles, :general_file_file_size
    remove_column :profiles, :general_file_updated_at
    
    remove_column :profiles, :soldier_file_file_name
    remove_column :profiles, :soldier_file_content_type
    remove_column :profiles, :soldier_file_file_size
    remove_column :profiles, :soldier_file_updated_at
    
    remove_column :profiles, :magic_file_file_name
    remove_column :profiles, :magic_file_content_type
    remove_column :profiles, :magic_file_file_size
    remove_column :profiles, :magic_file_updated_at
    
    remove_column :profiles, :item_file_file_name
    remove_column :profiles, :item_file_content_type
    remove_column :profiles, :item_file_file_size
    remove_column :profiles, :item_file_updated_at
    
    remove_column :profiles, :land_file_file_name
    remove_column :profiles, :land_file_content_type
    remove_column :profiles, :land_file_file_size
    remove_column :profiles, :land_file_updated_at
    
    add_column :profiles, :keep, :string
    add_column :profiles, :general, :string
    add_column :profiles, :soldier, :string
    add_column :profiles, :magic, :string
    add_column :profiles, :item, :string
    add_column :profiles, :land, :string
  end

  def down
  end
end