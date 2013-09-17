class Weapon < ActiveRecord::Base
  attr_accessible :name, :attack, :defense, :upkeep, :base_cost, :avatar, :e_attack, :e_defense, :div_power, :slots,
    :url, :piercing, :resistance, :general_id, :general, :bonus_type, :bonus
  
  validates :name, :presence => true
  validates :attack, :defense, :piercing, :resistance, :presence => true, :numericality => { :only_integer => true }
  validates :base_cost, :upkeep, :div_power, :numericality => { :only_integer => true }, :allow_nil => true
  
  has_many :arms
  has_attached_file :avatar, :styles => { :medium => "160x160>", :thumb => "50x50>" }
  validates_attachment :avatar,
    :size => { :in => 0..100.kilobytes }
  belongs_to :loadoutable, :polymorphic => true
  belongs_to :general
  
  before_save :update_e_attack
  before_save :update_e_defense
  
  scope :attack, -> { where(bonus_type: ['attack','both']) }
  scope :defense, -> { where(bonus_type: ['defense','both']) }
  
  cattr_reader :per_page
  @@per_page = 25
  @permitted_columns = ['name','attack','defense','e_attack','e_defense','base_cost','upkeep','div_power']
  
  def is_unowned?
    !arms.exists?
  end
  
  def image_path(t)
    unless url.blank?
      url
    else
      unless avatar_file_name.nil?
        avatar.url(t)
      else
        'favor_clear.gif'
      end
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

    options[:c] = @permitted_columns.include?(options[:c]) ? options[:c] : 'e_attack'

    Weapon.order(options[:c] + " " + ((options[:d] == 'up') ? "ASC" : "DESC")).paginate(:page => options[:page])
  end
end
