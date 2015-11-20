class Accessory < ActiveRecord::Base
  attr_accessible :item_id, :profile_id, :owned
    
  belongs_to :profile
  belongs_to :item
  
  validates :item_id, :presence => true
  validates :owned, :presence => true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  
  scope :amulet, :joins => :item, :conditions => "type = 'Item::Amulet'"
  scope :armor, :joins => :item, :conditions => "type = 'Item::Armor'"
  scope :boot, :joins => :item, :conditions => "type = 'Item::Boot'"
  scope :helmet, :joins => :item, :conditions => "type = 'Item::Helmet'"
  scope :glove, :joins => :item, :conditions => "type = 'Item::Glove'"
  scope :shield, :joins => :item, :conditions => "type = 'Item::Shield'"
  scope :banner, :joins => :item, :conditions => "type = 'Item::Banner'"
end
