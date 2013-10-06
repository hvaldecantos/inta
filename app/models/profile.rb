class Profile < ActiveRecord::Base
  attr_accessible  :nombre, :apellido, :telefono_fijo, :telefono_celular

  belongs_to :user

  has_many :roles, :through => :user

  scope :agentes, joins(:roles).where("roles.name = 'Agente' ").order('apellido, nombre ASC')
  scope :extensionistas, joins(:roles).where("roles.name = 'Extensionista' ").order('apellido, nombre ASC')
  scope :promotores, joins(:roles).where("roles.name = 'Extensionista' ").order('apellido, nombre ASC')
  scope :laboratoristas, joins(:roles).where("roles.name = 'Laboratorista' ").order('apellido, nombre ASC')

  has_many :agente_analisis_rsds, :foreign_key => "agente_id", class_name: "AnalisisRsd"
  has_many :promotor_analisis_rsds, :foreign_key => "promotor_id", class_name: "AnalisisRsd"
  has_many :laboratorista_analisis_rsds, :foreign_key => "laboratorista_id", class_name: "AnalisisRsd"

  def analisis_rsds
    res = []
    mis_roles = self.roles.map{|r| r.name}
    if mis_roles.include?("Agente") then res += agente_analisis_rsds end
    if mis_roles.include?("Extensionista") then  res += promotor_analisis_rsds end
    if mis_roles.include?("Laboratorista") then res += laboratorista_analisis_rsds end
    res
  end

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
