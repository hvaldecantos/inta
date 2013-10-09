# == Schema Information
#
# Table name: personas
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  nombre     :string(255)
#  apellido   :string(255)
#  dni        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Persona < ActiveRecord::Base
  attr_accessible :apellido, :dni, :nombre

  belongs_to :user
  
  has_many :profiles
  after_create :crear_perfiles_asociados_segun_programas_y_roles

  has_many :roles, :through => :user

  has_many :programas, :through => :user, :uniq => true

  private
    def crear_perfiles_asociados_segun_programas_y_roles
      programas.each do |programa|
        roles.where("programa_id = #{programa.id}").each do |role|
          profiles.create(type: role.profile_subclass_name.camelize)
        end
      end
    end

end
