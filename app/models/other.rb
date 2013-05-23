class Other < ActiveRecord::Base
  attr_accessible :name
  
  validates :name, :presence => true
  
  cattr_reader :per_page
  @@per_page = 25
  @permitted_columns = ['name']
  
  def self.search(*args)
    options = args.extract_options!

    options[:c] = @permitted_columns.include?(options[:c]) ? options[:c] : 'name'

    Other.order(options[:c] + " " + ((options[:d] == 'up') ? "DESC" : "ASC")).paginate(:page => options[:page])
  end
end
