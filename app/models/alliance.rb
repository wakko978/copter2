class Alliance < ActiveRecord::Base
  belongs_to :profile
  belongs_to :primary, :class_name => "Recruit", :foreign_key => :primary_link
  belongs_to :secondary, :class_name => "Recruit", :foreign_key => :secondary_link
  belongs_to :tertiary, :class_name => "Recruit", :foreign_key => :tertiary_link
  
  attr_accessible :profile_id, :primary_link, :secondary_link, :tertiary_link
  
  validates :profile_id, :presence => true
  validates :primary_link, :secondary_link, presence: true
  validates :primary_link, uniqueness: {scope: :profile_id}
end
