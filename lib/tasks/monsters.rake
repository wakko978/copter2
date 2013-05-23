namespace :monsters do
  desc 'Transfer monsters from v1 to v2'
  task :transfer do
    Rake::Task[:environment].invoke
    
    class LegacyMonsters < ActiveRecord::Base
      set_table_name 'monsters'
      establish_connection "copterV1"
    end
    
    @monsters = LegacyMonsters.all
    
    @monsters.each do |monster|
      item = Monster.create!(
        :name => monster.name,
        :attack_type => monster.attack_type,
        :minutes => monster.minutes,
        :div_power => monster.div_power
      )
    end
  end
end