class ClearLandAvatars < ActiveRecord::Migration
  def up
    Land.all.each do |l|
      l.avatar.destroy
    end
  end

  def down
  end
end
