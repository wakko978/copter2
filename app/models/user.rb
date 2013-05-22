class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :roles
  before_create :set_default_role

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  
  def is_admin?
    has_role?('Admin')
  end
  
  def has_role?(role)
    roles.pluck(:name).include?(role)
  end
  
  private
    def set_default_role
      self.roles << Role.find_by_name('User')
    end
end
