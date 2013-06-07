namespace :generals do
  desc 'Stub general class file'
  task :stub, [:name] do |t, args|
    Rake::Task[:environment].invoke
    
    puts General.stub_model(args.name)
    
    puts "Remember to bounce the app now"
  end
  desc 'Stub all general class files'
  task :stub_all do
    Rake::Task[:environment].invoke
    
    @generals = General.all
    
    @generals.each do |general|
      puts General.stub_model(general.name)
    end
    
    puts "Remember to bounce the app now"
  end
  desc 'Retype a general after creating the stub class and bouncing the app'
  task :retype, [:name,:type] do |t, args|
    Rake::Task[:environment].invoke
    
    general = General.find_by_name(args.name)
    
    if general
      general.update_attribute(:type,args.type)
    else
      puts "Couldn't find #{args.name}"
    end
  end
  task :retype_all do
    Rake::Task[:environment].invoke
    
    @generals = General.all
    
    @generals.each do |general|
      class_name = general.name.gsub(/\*/,'').gsub(/\s/,'_').classify
      general.update_attribute(:type,class_name)
    end
  end
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
      General.stub_model(general.name)
      
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
    
    puts "Remember to bounce the app now"
  end
end