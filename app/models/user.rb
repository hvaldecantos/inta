# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

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

  has_many :programas, :through => :roles, :uniq => true

  has_one :persona
  after_create :crear_persona_asociada

  scope :extensionistas, joins(:roles).where("roles.name = 'Extensionista' ")

  after_update :update_persona_profile

  def update_persona_profile
    old_profiles = {}
    Profile.where("persona_id = #{persona.id}").each do |c|
      old_profiles[c.type] = c.id
    end

    edited_profiles = []
    programas.each do |programa|
      roles.where("programa_id = #{programa.id}").each do |role|
        edited_profiles << role.profile_subclass_name.camelize
      end
    end
    
    new_profiles = old_profiles.select{|k,v| edited_profiles.include?(k) }
    old_profiles = old_profiles.select{|k,v| !new_profiles.include?(k)}
    edited_profiles.each{|p| new_profiles[p] = new_profiles[p]}

    puts new_profiles
    new_profiles.each do |k,v|
      if v.nil? then
        persona.profiles.create(type: k)
      end
    end
    old_profiles.each{|k,v| Profile.destroy(v)}
  end

  def has_role?(role_sym)
    roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end

  private
    def crear_persona_asociada
      create_persona(nombre: email, apellido: email)
    end

end
