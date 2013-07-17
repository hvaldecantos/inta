class Profile < ActiveRecord::Base
  attr_accessible  :nombre, :apellido, :telefono_fijo, :telefono_celular

  belongs_to :user
end
