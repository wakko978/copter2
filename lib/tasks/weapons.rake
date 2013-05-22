namespace :weapons do
  desc 'Transfer weapons from v1 to v2'
  task :transfer do
    Rake::Task[:environment].invoke
    
    class LegacyWeapons < ActiveRecord::Base
      set_table_name 'weapons'
      establish_connection "copterV1"
      
      def image
        MbsFile.find_by_associated_with(self.files)
      end
    end
    
    class MbsFile < ActiveRecord::Base
      set_table_name 'mbs_files'
      establish_connection "copterV1"
      
      def rel_path
        self.file_name.gsub(/.*public\//,'')
      end
    end
    
    @weapons = LegacyWeapons.all
    
    @weapons.each do |weapon|
      item = Weapon.create!(
        :name => weapon.name,
        :attack => weapon.attack,
        :defense => weapon.defense,
        :base_cost => weapon.base_cost,
        :upkeep => weapon.upkeep,
        :div_power => weapon.div_power,
        :avatar => File.open("/Users/workaccount/Sites/copter2/lib/assets/mbs_file/file_name/#{weapon.image.id}/#{weapon.image.rel_path}")
      )
    end
  end
end