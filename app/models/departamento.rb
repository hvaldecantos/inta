class Departamento < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :analisis_rsds
end
