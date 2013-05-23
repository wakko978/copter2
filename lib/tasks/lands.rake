namespace :lands do
  desc 'Transfer lands from v1 to v2'
  task :transfer do
    Rake::Task[:environment].invoke
    
    class LegacyLands < ActiveRecord::Base
      set_table_name 'lands'
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
    
    @lands = LegacyLands.all
    
    @lands.each do |land|
      item = Land.create!(
        :name => land.name,
        :base_cost => land.base_cost,
        :income => land.income,
        :incremental_cost => land.incremental_cost,
        :avatar => File.open("/Users/workaccount/Sites/copter2/lib/assets/mbs_file/file_name/#{land.image.id}/#{land.image.rel_path}")
      )
    end
  end
end