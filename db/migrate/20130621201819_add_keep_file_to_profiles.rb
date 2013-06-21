class AddKeepFileToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :keep_file_file_name, :string
    add_column :profiles, :keep_file_content_type, :string
    add_column :profiles, :keep_file_file_size, :integer
    add_column :profiles, :keep_file_updated_at, :datetime
  end
end