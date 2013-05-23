class Monster < ActiveRecord::Base
  attr_accessible :name, :attack_type, :minutes, :description, :div_power
    
  validates :name, :presence => true, :uniqueness => true
  validates :minutes, :numericality => {:greater_than_or_equal_to => 0}
  
  cattr_reader :per_page
  @@per_page = 25
  @permitted_columns = ['name','minutes','attack_type','div_power']
  
  def self.search(*args)
    options = args.extract_options!

    options[:c] = @permitted_columns.include?(options[:c]) ? options[:c] : 'name'

    Monster.order(options[:c] + " " + ((options[:d] == 'up') ? "DESC" : "ASC")).paginate(:page => options[:page])
  end
end
