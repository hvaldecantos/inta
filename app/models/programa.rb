class Programa < ActiveRecord::Base
  attr_accessible :descripcion, :nombre

  has_many :roles

end
