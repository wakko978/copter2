namespace :powers do
  desc 'Transfer powers from v1 to v2'
  task :transfer do
    Rake::Task[:environment].invoke
    
    class LegacyPowers < ActiveRecord::Base
      set_table_name 'powers'
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
    
    @powers = LegacyPowers.all
    
    @powers.each do |power|
      item = Power.create!(
        :name => power.name,
        :attack => power.attack,
        :defense => power.defense,
        :base_cost => power.base_cost,
        :upkeep => power.upkeep,
        :div_power => power.div_power,
        :avatar => File.open("/Users/workaccount/Sites/copter2/lib/assets/mbs_file/file_name/#{power.image.id}/#{power.image.rel_path}")
      )
    end
  end
end