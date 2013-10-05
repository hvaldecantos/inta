class Profile < ActiveRecord::Base
  attr_accessible  :nombre, :apellido, :telefono_fijo, :telefono_celular

  belongs_to :user

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
