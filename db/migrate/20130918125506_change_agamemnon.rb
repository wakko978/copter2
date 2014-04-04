class ChangeAgamemnon < ActiveRecord::Migration
  def up
    General.find_by_name('Agamemnon').update_attribute(:type,'Agamemnon')
  end

  def down
  end
end
