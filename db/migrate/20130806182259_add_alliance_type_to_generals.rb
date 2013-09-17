class AddAllianceTypeToGenerals < ActiveRecord::Migration
  def change
    add_column :generals, :alliance_type, :string
    
    General.find_all_by_name(['Odin','Annika','Aesir']).each do |g|
      g.update_attribute(:alliance_type,'piercing')
    end
    General.find_all_by_name(['Vanathan','Vanir']).each do |g|
      g.update_attribute(:alliance_type,'resistance')
    end
    General.find_all_by_name(['Vancy','Sorkan','Sahar','Feral','Therian','Elin','Zarevok']).each do |g|
      g.update_attribute(:alliance_type,'monster_attack')
    end
    General.find_all_by_name(['Jera','Deimos','Gabrielle','Deianira']).each do |g|
      g.update_attribute(:alliance_type,'damage')
    end
    General.find_all_by_name(['Tora','Daphne','Persephone']).each do |g|
      g.update_attribute(:alliance_type,'deflect')
    end
    General.find_all_by_name(['Kang','Dolomar','Charlotte','Lotus Ravenmoore','Lothar the Ranger','Slayer','Kaiser','Vorenus']).each do |g|
      g.update_attribute(:alliance_type,'crits')
    end
    General.find_all_by_name(['Dawn','Sanna']).each do |g|
      g.update_attribute(:alliance_type,'cleric_splash')
    end
    General.find_all_by_name(['Zurran','Muse','Alexandria']).each do |g|
      g.update_attribute(:alliance_type,'mage_splash')
    end
    General.find_all_by_name(['Raziel the Silent','Jezale','Elyvita']).each do |g|
      g.update_attribute(:alliance_type,'evade')
    end
    General.find_all_by_name(['Ameron','Attilius']).each do |g|
      g.update_attribute(:alliance_type,'whirlwind')
    end
    General.find_all_by_name(['Mischa','Elaida']).each do |g|
      g.update_attribute(:alliance_type,'healing')
    end
  end
end