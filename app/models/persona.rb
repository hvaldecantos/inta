# == Schema Information
#
# Table name: personas
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  nombre           :string(255)
#  apellido         :string(255)
#  dni              :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  telefono_fijo    :string(255)
#  telefono_celular :string(255)
#

class Persona < ActiveRecord::Base
  attr_accessible :apellido, :dni, :nombre, :telefono_celular, :telefono_fijo, :profiles_attributes

  validates_presence_of :apellido, :nombre
  validates_uniqueness_of :dni, :allow_nil => true, :allow_blank => true
  
  belongs_to :user
  
  has_many :profiles
  accepts_nested_attributes_for :profiles
  after_create :crear_perfiles_asociados_segun_programas_y_roles

  has_many :roles, :through => :user

  has_many :programas, :through => :user, :uniq => true


  def apellido_nombre
    nombre_completo = ""
    if apellido.nil? == false
      nombre_completo << apellido
    end
    if nombre.nil? == false
      unless apellido.nil? then nombre_completo << " " end
      nombre_completo << nombre
    end
    nombre_completo
  end

  private
    def crear_perfiles_asociados_segun_programas_y_roles
      programas.each do |programa|
        roles.where("programa_id = #{programa.id}").each do |role|
          profiles.create(type: role.profile_subclass_name.camelize)
        end
      end
    end

end
