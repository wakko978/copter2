namespace :soldiers do
  desc 'Transfer soldiers from v1 to v2'
  task :transfer do
    Rake::Task[:environment].invoke
    
    class LegacySoldiers < ActiveRecord::Base
      set_table_name 'soldiers'
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
    
    @soldiers = LegacySoldiers.all
    
    @soldiers.each do |soldier|
      item = Soldier.create!(
        :name => soldier.name,
        :attack => soldier.attack,
        :defense => soldier.defense,
        :base_cost => soldier.base_cost,
        :upkeep => soldier.upkeep,
        :avatar => File.open("/Users/workaccount/Sites/copter2/lib/assets/mbs_file/file_name/#{soldier.image.id}/#{soldier.image.rel_path}")
      )
    end
  end
end