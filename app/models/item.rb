class Item < ActiveRecord::Base
  attr_accessible :name, :attack, :defense, :upkeep, :base_cost, :e_attack, :e_defense, :div_power,
    :url, :piercing, :resistance, :slots, :general_id, :general, :bonus_type, :bonus
  
  validates :name, :presence => true
  validates :attack, :defense, :piercing, :resistance, :presence => true, :numericality => { :only_integer => true }
  validates :base_cost, :upkeep, :div_power, :numericality => { :only_integer => true }, :allow_nil => true
  
  has_many :accessories
  belongs_to :loadoutable, :polymorphic => true
  belongs_to :general
  
  before_save :update_e_attack
  before_save :update_e_defense
  
  scope :amulet, :conditions => "type = 'Item::Amulet'"
  scope :armor, :conditions => "type = 'Item::Armor'"
  scope :boot, :conditions => "type = 'Item::Boot'"
  scope :helmet, :conditions => "type = 'Item::Helmet'"
  scope :glove, :conditions => "type = 'Item::Glove'"
  scope :shield, :conditions => "type = 'Item::Shield'"
  scope :banner, :conditions => "type = 'Item::Banner'"
  scope :attack, -> { where(bonus_type: 'attack') }
  scope :defense, -> { where(bonus_type: 'defense') }
  
  cattr_reader :per_page
  @@per_page = 25
  @permitted_columns = ['name','attack','defense','e_attack','e_defense','base_cost','upkeep','div_power']
  
  def self.permitted_columns
    @permitted_columns
  end
  
  def is_unowned?
    !accessories.exists?
  end
  
  def image_path(t)
    unless url.blank?
      url
    else
      'favor_clear.gif'
    end
  end
  
  def update_e_attack
    self.e_attack = attack + defense*0.7
  end
  
  def update_e_defense
    self.e_defense = defense + attack*0.7
  end
  
  def self.search(*args)
    options = args.extract_options!

    options[:c] = Item.permitted_columns.include?(options[:c]) ? options[:c] : 'e_attack'

    Item.order(options[:c] + " " + ((options[:d] == 'up') ? "ASC" : "DESC")).paginate(:page => options[:page])
  end
end
