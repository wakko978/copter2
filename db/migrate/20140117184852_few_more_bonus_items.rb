class FewMoreBonusItems < ActiveRecord::Migration
  def up
    ## Gabrielle
    General.find_by_name("Deianira").update_attributes(general: General.find_by_name("Gabrielle"), bonus_type: 'other', bonus: 10)
    
    ## Vorenus
    Soldier.find_by_name("Shadow Panther").update_attributes(general: General.find_by_name("Vorenus"), bonus_type: 'other', bonus: 0)
    
    ## Zurran
    General.find_by_name("Alexandria").update_attributes(general: General.find_by_name("Zurran"), bonus_type: 'other', bonus: 2)    
  end

  def down
  end
end
