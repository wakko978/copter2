class ChangeKatherine < ActiveRecord::Migration
  def up
    General.find_by_name('Katherine').update_attribute(:type,'Katherine')
  end

  def down
  end
end
