class AddPromoteLevelToRecruits < ActiveRecord::Migration
  def self.up
    add_column :recruits, :promote_level, :integer, default: 1
  end

  def self.down
  end
end
