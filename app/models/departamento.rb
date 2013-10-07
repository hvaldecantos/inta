# == Schema Information
#
# Table name: departamentos
#
#  provincia_id :integer
#  id_base      :integer
#  id           :integer          not null, primary key
#  nombre       :string(255)
#  cabecera     :string(255)
#

class Departamento < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :analisis_rsds
end
