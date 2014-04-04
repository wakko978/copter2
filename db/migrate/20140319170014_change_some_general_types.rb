class ChangeSomeGeneralTypes < ActiveRecord::Migration
  def up
    General.find_by_name('Azeron**').update_attribute(:type,'Azeron')
    General.find_by_name('Mephistopheles').update_attribute(:type,'Mephistopheles')
    General.find_by_name('Stone Guardian').update_attribute(:type,'StoneGuardian')
    General.find_by_name('Orc King').update_attribute(:type,'OrcKing')
  end

  def down
  end
end
