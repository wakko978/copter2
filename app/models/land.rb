class Land < ActiveRecord::Base
  attr_accessible :name, :income, :base_cost, :incremental_cost, :url
  
  validates :name, :presence => true, :uniqueness => true
  validates :base_cost, :income, :presence => true, :numericality => { :only_integer => true }
  validates :incremental_cost, :presence => true, :numericality => true
  
  cattr_reader :per_page
  @@per_page = 10
  @permitted_columns = ['name','base_cost','incremental_cost','income']
  
  def image_path(t)
    unless url.blank?
      url
    else
      'favor_clear.gif'
    end
  end
  
  def self.search(*args)
    options = args.extract_options!

    options[:c] = @permitted_columns.include?(options[:c]) ? options[:c] : 'income'

    Land.order(options[:c] + " " + ((options[:d] == 'up') ? "DESC" : "ASC")).paginate(:page => options[:page])
  end
end
