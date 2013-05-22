namespace :items do
  desc 'Transfer items from v1 to v2'
  task :transfer do
    Rake::Task[:environment].invoke
    
    class LegacyItems < ActiveRecord::Base
      set_table_name 'items'
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
    
    @items = LegacyItems.all
    
    @items.each do |item|
      i = "Item::#{item.item_type}".constantize.create!(
        :name => item.name,
        :attack => item.attack,
        :defense => item.defense,
        :base_cost => item.base_cost,
        :upkeep => item.upkeep,
        :div_power => item.div_power,
        :avatar => item.image.nil? ? nil : File.open("/Users/workaccount/Sites/copter2/lib/assets/mbs_file/file_name/#{item.image.id}/#{item.image.rel_path}")
      )
    end
  end
end