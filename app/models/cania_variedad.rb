class CaniaVariedad < ActiveRecord::Base
  attr_accessible :descripcion, :nombre

  validates_presence_of :nombre
end
