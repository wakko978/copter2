namespace :others do
  desc 'Transfer others from v1 to v2'
  task :transfer do
    Rake::Task[:environment].invoke
    
    class LegacyOthers < ActiveRecord::Base
      set_table_name 'others'
      establish_connection "copterV1"
    end
    
    @others = LegacyOthers.all
    
    @others.each do |other|
      item = Other.create!(
        :name => other.name
      )
    end
  end
end