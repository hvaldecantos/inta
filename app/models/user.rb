class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_ids
  
  has_many :assignments
  has_many :roles, :through => :assignments

  has_one :profile
  after_create :create_user_profile

  scope :extensionistas, joins(:roles).where("roles.name = 'Extensionista' ")

  def has_role?(role_sym)
    roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end

  private
    def create_user_profile
      create_profile(nombre: email)
    end

end
