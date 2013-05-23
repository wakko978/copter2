namespace :generals do
  desc 'Transfer generals from v1 to v2'
  task :transfer do
    Rake::Task[:environment].invoke
    
    class LegacyGenerals < ActiveRecord::Base
      set_table_name 'generals'
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
    
    @generals = LegacyGenerals.all
    
    @generals.each do |general|
      item = General.create!(
        :name => general.name,
        :attack => general.attack,
        :defense => general.defense,
        :base_cost => general.base_cost,
        :upkeep => general.upkeep,
        :div_power => general.div_power,
        :attack_increment => general.attack_increment,
        :defense_increment => general.defense_increment,
        :description => general.description,
        :avatar => general.image.nil? ? nil : File.open("/Users/workaccount/Sites/copter2/lib/assets/mbs_file/file_name/#{general.image.id}/#{general.image.rel_path}")
      )
    end
  end
end