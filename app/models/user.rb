class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :roles
  before_create :set_default_role
  has_many :profiles, :dependent => :destroy

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_ids
  # attr_accessible :title, :body
  
  @permitted_columns = ['email','last_sign_in_at','created_at','sign_in_count','current_sign_in_at']
  
  def is_admin?
    has_role?('Admin')
  end
  
  def has_role?(role)
    roles.pluck(:name).include?(role)
  end
  
  def self.search(*args)
    options = args.extract_options!

    options[:c] = @permitted_columns.include?(options[:c]) ? options[:c] : 'current_sign_in_at'
    
    @users = User.includes(:profiles).scoped
    if options[:filters]
      filters = options[:filters]
      if filters[:term]
        @users = @users.where(
          "UPPER(users.email) LIKE ?
           OR UPPER(profiles.name) LIKE ?","%#{filters[:term].upcase}%","%#{filters[:term].upcase}%"
        )
      end
    end

    @users = @users.order(options[:c] + " " + ((options[:d] == 'up') ? "ASC" : "DESC")).paginate(:page => options[:page])
  end
  
  private
    def set_default_role
      self.roles << Role.find_by_name('User')
    end
end
