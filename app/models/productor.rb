class Productor < ActiveRecord::Base
  attr_accessible :agencia, :apellido, :comuna_municipio_id, :departamento_id, :dni, :email_extensionista, :nombre

  validates_presence_of :apellido, :nombre
  validates_uniqueness_of :dni, :allow_nil => true

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
