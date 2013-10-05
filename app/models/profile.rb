class Profile < ActiveRecord::Base
  attr_accessible  :nombre, :apellido, :telefono_fijo, :telefono_celular

  belongs_to :user

  has_many :roles, :through => :user

  scope :agentes, joins(:roles).where("roles.name = 'Agente' ").order('apellido, nombre ASC')
  scope :extensionistas, joins(:roles).where("roles.name = 'Extensionista' ").order('apellido, nombre ASC')
  scope :promotores, joins(:roles).where("roles.name = 'Extensionista' ").order('apellido, nombre ASC')
  scope :laboratoristas, joins(:roles).where("roles.name = 'Laboratorista' ").order('apellido, nombre ASC')

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
  
end
